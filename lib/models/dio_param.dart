// Cores
import 'package:dio/dio.dart';
// Utils
import 'package:flutter_bloc_boilerplate/utils/constants/api_resource.dart';

class DioParam {
  String method;
  String path;
  String fullPath;
  Map<String, dynamic> header;
  Map<String, dynamic> body;
  Map<String, dynamic> queryParameters;
  DioParamUpDownload? paramDownload;
  DioParamUpload? paramUpload;

  DioParam({
    this.method = ApiResource.get,
    this.path = '',
    this.fullPath = '',
    this.header = const {},
    this.body = const {},
    this.queryParameters = const {},
    this.paramDownload,
    this.paramUpload,
  });
}

class DioParamUpDownload {
  String savePathDownload;
  Function(int received, int total) onReceiveProgress;
  CancelToken cancelTaskUpDownload;

  DioParamUpDownload({
    required this.onReceiveProgress,
    required this.cancelTaskUpDownload,
    required this.savePathDownload,
  });
}

class DioParamUpload {
  Function(int received, int total) onReceiveProgress;
  CancelToken cancelTaskUpDownload;

  DioParamUpload({
    required this.onReceiveProgress,
    required this.cancelTaskUpDownload,
  });
}
