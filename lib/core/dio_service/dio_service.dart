import 'package:dio/dio.dart';

import 'dio_provider.dart';

abstract class DioService {
  late DioProvider dioProvider;

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
  });

  Future<Response> get({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    CancelToken? cancelToken,
    Duration? timeOut,
    bool isMultipart = false,
  });
  Future<Response> delete({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    CancelToken? cancelToken,
    Duration? timeOut,
    bool isMultipart = false,
  });
}
