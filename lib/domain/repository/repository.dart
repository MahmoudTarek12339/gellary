import 'package:dartz/dartz.dart';
import 'package:my_gallery/domain/model/authentication_model.dart';
import 'package:my_gallery/domain/model/images_model.dart';

import '../../data/network/failure.dart';
import '../../data/network/requests.dart';

abstract class Repository {
  Future<Either<Failure, AuthenticationModel>> login(LoginRequest loginRequest);

  Future<Either<Failure, ImagesModel>> getGallery();

  Future<Either<Failure, ImagesModel>> uploadImage(UploadImageRequest image);
}
