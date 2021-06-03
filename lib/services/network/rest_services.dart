import 'package:dio/dio.dart';
import 'package:f_logs/f_logs.dart';
import 'package:kutilang_example/services/local/database_services.dart';
import 'package:kutilang_example/utils/config.dart';
import 'package:logging/logging.dart';

import 'rest_error_util.dart';

class RestServices {
  static final log = Logger('AuthBloc');
  static Dio _dio = Dio()
    ..options.baseUrl = API
    ..options.connectTimeout = TIMEOUT_CONNECTION
    ..options.receiveTimeout = TIMEOUT_RECEIVE
    ..interceptors.clear()
    ..interceptors.add(LogInterceptor(responseBody: true))
    ..interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options,
            RequestInterceptorHandler requestHandler) async {
          try {
            String? token = (await DatabaseServices.db.fetchToken());
            options.headers["Authorization"] = "Bearer " + token;
          } catch (e) {
            log.info(options.headers.toString());
          }
          //requestHandler.resolve(response);
        },
        onResponse:
            (Response<dynamic> e, ResponseInterceptorHandler responseHandler) =>
                {log.info(e.toString())},
        onError: (DioError error, ErrorInterceptorHandler errorHandler) async {
          log.info(DioErrorUtil.handleError(error));
          // Do something with response error
          if (error.response?.statusCode == 403) {
            // requestLock.lock()-> If no token, request token firstly and lock this interceptor
            // to prevent other request enter this interceptor.
            _dio.interceptors.requestLock.lock();
            _dio.interceptors.responseLock.lock();
          }
        }));

  // Get:-----------------------------------------------------------------------
  static Future<dynamic> fetch(String uri) async {
    try {
      final Response response = await _dio.get(uri);
      // FLog.info(text: response.data.toString());
      return response.data;
    } catch (e) {
      // FLog.error(text: e.toString());
      throw e;
    }
  }

  // Post:----------------------------------------------------------------------
  static Future<dynamic> post(String uri, dynamic data) async {
    // try {
    final Response response = await _dio.post(uri, data: data);
     FLog.info(text: uri + response.data);
    return response.data;
    /*  } catch (e) {
      FLog.error(text: e.toString());
      throw e;
    } */
  }

  // Post:----------------------------------------------------------------------
  static Future<dynamic> delete(String uri, dynamic id) async {
    try {
      final Response response = await _dio.delete(uri, data: id);
      return response.data;
    } catch (e) {
      // FLog.error(text: e.toString());
      throw e;
    }
  }

  // Post:----------------------------------------------------------------------
  static Future<dynamic> put(String uri, dynamic data) async {
    try {
      final Response response = await _dio.put(uri, data: data);
      return response.data;
    } catch (e) {
      // FLog.error(text: e.toString());
      throw e;
    }
  }
}
