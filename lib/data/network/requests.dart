import 'dart:io';

class LoginRequest {
  String email;
  String password;

  LoginRequest(this.email, this.password);
}

class UploadImageRequest {
  File image;

  UploadImageRequest(this.image);
}
