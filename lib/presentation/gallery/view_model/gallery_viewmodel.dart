import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:my_gallery/domain/usecase/gallery_usecase.dart';
import 'package:my_gallery/domain/usecase/get_images_usecase.dart';
import 'package:my_gallery/presentation/base/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

class GalleryViewModel extends BaseViewModel
    with GalleryViewModelInputs, GalleryViewModelOutputs {
  final GalleryUseCase _galleryUseCase;
  final GetImageUseCase _getImageUseCase;

  GalleryViewModel(this._galleryUseCase, this._getImageUseCase);

  final StreamController _imagesStreamController =
      BehaviorSubject<List<String>>();
  final StreamController _imageStreamController =
      StreamController<File>.broadcast();

  @override
  void start() {
    //inputState.add(ContentState());
    _getGalleryImages();
  }

  Future _getGalleryImages() async {
    (await _getImageUseCase.execute(GetImageUseCaseInput()))
        .fold((failure) => log(failure.toString()), (data) async {
      _imagesStreamController.add(data.images);
    });
  }

  Future uploadImage(File image) async {
    (await _galleryUseCase.execute(GalleryUseCaseInput(image)))
        .fold((failure) => log(failure.toString()), (data) async {
      _getGalleryImages();
    });
  }

  @override
  void dispose() {
    _imagesStreamController.close();
    _imageStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputForImageUpload => _imageStreamController.sink;

  @override
  Sink get inputGalleryImages => _imageStreamController.sink;

  @override
  Stream<List<String>> get outputImages =>
      _imagesStreamController.stream.map((image) => image);
}

mixin GalleryViewModelInputs {
  Sink get inputForImageUpload;

  Sink get inputGalleryImages;
}

mixin GalleryViewModelOutputs {
  Stream<List<String>> get outputImages;
}
