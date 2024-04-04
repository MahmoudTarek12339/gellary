import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:my_gallery/app/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "Authorization";
const String Token =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYjY1YmIwZWYwMmQ3NmU1ODQ4OGI3MTAzNGYxZTAxODI4OTFhNzdmYTg3MmJjMGY3OTllZWU2NDlkMmEwNGZhYTlhZmI5ZjQ5MzhiZWQ0ZWUiLCJpYXQiOjE3MTIyMzcyOTkuNjE4ODY1LCJuYmYiOjE3MTIyMzcyOTkuNjE4ODY3LCJleHAiOjE3NDM3NzMyOTkuNjE4MTg5LCJzdWIiOiIyODAiLCJzY29wZXMiOltdfQ.jLVxqDgwRpCO7bGbjBk2qlWfwSlzHASW2fyddTByI5BwcEYCdPs6jc_9t2PdXlS_vKtTJosRgqd7b29bBS61hYgS63XeU0X-UDL4Ha3C9uoP_BAoXiYJq9KJFx5vqs4ZK4aBldFzuf1oOpOLP0G_lEJ8_q4HW0fH-Z8mRLND-3H_5XqRQTZD9p1gnl2Ss5Ch-R0-EdmtmQWT1Fv1am7enbIvTHyew3PLWKCWDrdf8cf-JV-WMA7xDXUauQ84H3wD9pNkPZWWFplgleBmD9LbvTlmZ-BJ8xngFeDJqutJfH-WoRO0Yr_MavvzUV1Kd46T9_Abt_RMwgYVoKxzJBHerC7sugEBh81IU9i35wlYrqIMy_QpJN2YzhinfeHkupQRYN5VNzxWgw75E8wYxJrycf1J4qIoPtnCiPaGyQNJ_qI1_ft6cFCCU4JPVhZ8QUf0wALcvV7K2s9yfRh3f5BBZ_AYsltVQ1MC8MgQnn313tdS_q5x8yMIYmtIpQ7Zanfx0czmPViEoBPySf3jQ9f0olgaeIDnW07KyqqpLtRGkbdRc_1ZJtZMdba2wSytO60aQ5WSmHWTfVfCdTjvRL7QIRILPBOukmB7UTwuPxbQJJvOByjo6yfk5lLct39BWnRGZ-PzoNGCCF8uj59qt4SUu9s4UbMrgw4WiOCihA-6Jtk';
const String AUTHORIZATION_VALUE = "Bearer $Token";
const String LANGUAGE = "lang";
const String DEFAULT_LANGUAGE = "en";

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();
    //String language = await _appPreferences.getAppLanguage();

    Map<String, String> headers = {
      AUTHORIZATION: AUTHORIZATION_VALUE,
      CONTENT_TYPE: APPLICATION_JSON,
      LANGUAGE: DEFAULT_LANGUAGE // todo get lang from app prefs
    };

    dio.options = BaseOptions(
        baseUrl: Constants.baseUrl,
        headers: headers,
        receiveTimeout: const Duration(milliseconds: Constants.apiTimeOut),
        sendTimeout: const Duration(milliseconds: Constants.apiTimeOut));
    if (!kReleaseMode) {
      // its debug mode so print app logs
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
    return dio;
  }
}
