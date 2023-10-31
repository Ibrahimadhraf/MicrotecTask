import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'dio_provider.dart';
import 'dio_service.dart';

class DioServiceImpl implements DioService {
  @override
  DioProvider dioProvider;

  DioServiceImpl({
    required this.dioProvider,
  });

  @override
  Future<Response> get({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    Map<String, dynamic>? headers,

    CancelToken? cancelToken,
    Duration ?timeOut,
    bool isMultipart = false,
  }) async {
    final dio = dioProvider.get();

    if (timeOut != null) {
      dio.options.connectTimeout = timeOut;
    }

    dio.options.headers = headers??{
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',

    };

    debugPrint('URL => ${dio.options.baseUrl + endPoint}');
    debugPrint('Header => ${dio.options.headers.toString()}');
    debugPrint('Body => $data');
    debugPrint('Query => $query');

    return await dio.get(
      endPoint,
      queryParameters: query,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Response> post({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    Duration? timeOut,
    bool isMultipart = false,
  }) async {
    final dio = dioProvider.get();

    if (timeOut != null) {
      dio.options.connectTimeout = timeOut;
    }

    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };

    debugPrint('URL => ${dio.options.baseUrl + endPoint}');
    debugPrint('Header => ${dio.options.headers.toString()}');
    debugPrint('Body => $data');
    debugPrint('Query => $query');

    return await dio.post(
      endPoint,
      data: data,
      queryParameters: query,
      onSendProgress: progressCallback,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Response> delete({
    String? base,
    required String endPoint,
    data,
    query,
    String? token,
    CancelToken? cancelToken,
    Duration? timeOut,
    bool isMultipart = false,
  }) async {
    final dio = dioProvider.get();

    if (timeOut != null) {
      dio.options.connectTimeout = timeOut;
    }

    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };

    debugPrint('URL => ${dio.options.baseUrl + endPoint}');
    debugPrint('Header => ${dio.options.headers.toString()}');
    debugPrint('Body => $data');
    debugPrint('Query => $query');

    return await dio.delete(
      endPoint,
      data: data,
      queryParameters: query,
      cancelToken: cancelToken,
    );
  }
}
