import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:my_gallery/data/network/failure.dart';
import 'package:my_gallery/data/network/requests.dart';
import 'package:my_gallery/domain/model/images_model.dart';

import '../repository/repository.dart';
import 'base_usecase.dart';

class GetImageUseCase
    implements BaseUseCase<GetImageUseCaseInput, ImagesModel> {
  final Repository _repository;

  GetImageUseCase(this._repository);

  @override
  Future<Either<Failure, ImagesModel>> execute(
      GetImageUseCaseInput input) async {
    return await _repository.getGallery();
  }
}

class GetImageUseCaseInput {}
