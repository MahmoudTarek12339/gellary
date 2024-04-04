import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:my_gallery/data/network/failure.dart';
import 'package:my_gallery/data/network/requests.dart';
import 'package:my_gallery/domain/model/images_model.dart';

import '../repository/repository.dart';
import 'base_usecase.dart';

class GalleryUseCase implements BaseUseCase<GalleryUseCaseInput, ImagesModel> {
  final Repository _repository;

  GalleryUseCase(this._repository);

  @override
  Future<Either<Failure, ImagesModel>> execute(
      GalleryUseCaseInput input) async {
    return await _repository.uploadImage(UploadImageRequest(input.image));
  }
}

class GalleryUseCaseInput {
  File image;

  GalleryUseCaseInput(this.image);
}
