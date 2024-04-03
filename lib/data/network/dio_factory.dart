import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:my_gallery/app/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String LANGUAGE = "lang";
const String DEFAULT_LANGUAGE = "en";

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();
    //String language = await _appPreferences.getAppLanguage();

    Map<String, String> headers = {
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
