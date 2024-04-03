import 'package:my_gallery/domain/model/user_model.dart';

class AuthenticationModel {
  User? user;
  String token;

  AuthenticationModel(this.user, this.token);
}
