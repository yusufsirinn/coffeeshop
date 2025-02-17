import 'dart:io';

import 'package:dio/dio.dart' hide Response;
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

import '../../core.dart';
import 'interceptors/app_log_interceptor.dart';

typedef FutureResponse<T extends BaseResponseModel> = Future<Response<T>>;

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager.init();
    return _instance!;
  }

  late Dio _client;

  NetworkManager.init({HttpClientAdapter? adapter}) {
    final baseOptions = BaseOptions(baseUrl: AppConstants.baseURL);
    _client = Dio(baseOptions);
    _client.httpClientAdapter = adapter ?? IOHttpClientAdapter();
    _client.interceptors.addAll(
      [
        if (kDebugMode) AppLogInterceptor(),
      ],
    );
  }

  FutureResponse<T> fetch<T extends BaseResponseModel>({
    required String path,
    required BaseResponseModel model,
    Map<String, dynamic>? queryParameters,
    Method method = Method.get,
  }) async {
    RequestOptions requestOptions = RequestOptions(
      baseUrl: AppConstants.baseURL,
      path: path,
      queryParameters: queryParameters,
      method: method.toString(),
    );
    try {
      var response = await _client.fetch(requestOptions);
      if (response.statusCode == HttpStatus.ok) {
        if (response.data is List) {
          List<T> dataList = (response.data as List).map((item) => model.fromJson(item) as T).toList();
          return Response<T>(responseList: dataList);
        } else {
          T data = model.fromJson(response.data) as T;
          return Response<T>(response: data);
        }
      } else {
        throw Exception(response.data);
      }
    } on DioException catch (e) {
      return Response(error: Error(message: e.message.toString()));
    } catch (e) {
      return Response(error: Error(message: e.toString()));
    }
  }
}

enum Method {
  get(),
  put(),
  post(),
  patch();

  const Method();

  @override
  String toString() => name.toUpperCase();
}
