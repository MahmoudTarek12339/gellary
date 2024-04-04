import 'package:my_gallery/app/extensions.dart';
import 'package:my_gallery/domain/model/authentication_model.dart';
import 'package:my_gallery/domain/model/images_model.dart';

import '../../domain/model/user_model.dart';
import '../response/responses.dart';

extension UserResponseMapper on UserResponse {
  User toDomain() {
    return User(
        id.orZero(),
        name.orEmpty(),
        email.orEmpty(),
        email_verified_at.orEmpty(),
        created_at.orEmpty(),
        updated_at.orEmpty());
  }
}

extension LoginResponseMapper on LoginResponse {
  AuthenticationModel toDomain() {
    return AuthenticationModel(
      userResponse?.toDomain(),
      token.orEmpty(),
    );
  }
}

extension GetImagesResponseMapper on GetImagesResponse {
  ImagesModel toDomain() {
    return ImagesModel(
      status.orEmpty(),
      message.orEmpty(),
      data?.images.map((image) => image.orEmpty()).toList() as List<String>,
    );
  }
}

extension UploadImageResponseMapper on UploadImageResponse {
  ImagesModel toDomain() {
    return ImagesModel(
      status.orEmpty(),
      message.orEmpty(),
      data?.images.map((image) => image.orEmpty()).toList() as List<String>,
    );
  }
}
