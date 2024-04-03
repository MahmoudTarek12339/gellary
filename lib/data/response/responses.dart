@JsonSerializable()
class UserResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "email_verified_at")
  String? emailVerified_at;
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
  UserResponse? user;
  @JsonKey(name: "token")
  String? token;

  LoginResponse(this.user, this.token);

  // from json
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
