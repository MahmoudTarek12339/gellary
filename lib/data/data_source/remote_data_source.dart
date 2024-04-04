import 'package:my_gallery/data/network/app_api.dart';

import '../network/requests.dart';
import '../response/responses.dart';

abstract class RemoteDataSource {
  Future<LoginResponse> login(LoginRequest loginRequest);

  Future<UploadImageResponse> uploadImage(
      UploadImageRequest uploadImageRequest);

  Future<GetImagesResponse> getGallery();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password);
  }

  @override
  Future<GetImagesResponse> getGallery() async {
    return await _appServiceClient.getGallery();
  }

  @override
  Future<UploadImageResponse> uploadImage(
      UploadImageRequest uploadImageRequest) async {
    return await _appServiceClient.uploadImage(uploadImageRequest.image);
  }
}
