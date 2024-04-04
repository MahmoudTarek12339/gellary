import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "email_verified_at")
  String? email_verified_at;
  @JsonKey(name: "created_at")
  String? created_at;
  @JsonKey(name: "updated_at")
  String? updated_at;

  UserResponse(this.id, this.name, this.email, this.email_verified_at,
      this.created_at, this.updated_at);

  // from json
  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "user")
  UserResponse? userResponse;
  @JsonKey(name: "token")
  String? token;

  LoginResponse(this.userResponse, this.token);

  // from json
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class ImagesResponse {
  @JsonKey(name: "images")
  List<String> images;

  ImagesResponse(this.images);

// from json
  factory ImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$ImagesResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$ImagesResponseToJson(this);
}

@JsonSerializable()
class GetImagesResponse {
  @JsonKey(name: "data")
  ImagesResponse? data;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "message")
  String? message;

  GetImagesResponse(this.data, this.status, this.message);

  // from json
  factory GetImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetImagesResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$GetImagesResponseToJson(this);
}

@JsonSerializable()
class UploadImageResponse {
  @JsonKey(name: "data")
  ImagesResponse? data;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "message")
  String? message;

  UploadImageResponse(this.data, this.status, this.message);

  // from json
  factory UploadImageResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadImageResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$UploadImageResponseToJson(this);
}
