import 'package:dio/dio.dart';

import '../../app/constants.dart';
import '../response/responses.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST('login')
  Future<LoginResponse> login(
      @Field("email") String email, @Field("password") String password);
}
