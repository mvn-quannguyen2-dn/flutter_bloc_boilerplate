// Cores
import 'dart:io';
import 'package:dio/dio.dart';
// Services
import 'package:flutter_bloc_boilerplate/services/flavor_settings_service.dart';
// Utils
import 'package:flutter_bloc_boilerplate/utils/constants/type_request_api.dart';

class DioService {
  static final DioService _singleton = DioService._internal();

  factory DioService() {
    return _singleton;
  }

  DioService._internal();

  late Dio dio;

  Future<dynamic> requestHttpClient(DioParam dioParam) async {
    // Validation parameter
    assert(
      dioParam.fullPath.isNotEmpty && dioParam.path.isEmpty,
      dioParam.fullPath.isEmpty && dioParam.path.isNotEmpty,
    );
    if (dioParam.method == TypeRequestApi.download ||
        dioParam.method == TypeRequestApi.upload) {
      assert(
        dioParam.method == TypeRequestApi.download &&
            dioParam.paramDownload != null,
        dioParam.method == TypeRequestApi.upload &&
            dioParam.paramUpload != null,
      );
    }

    final headerDefault = <String, dynamic>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer ', [Use when authenticator jwt]
    };

    final pathRequest = dioParam.fullPath.isEmpty
        ? '${FlavorSettingsService.getFlavorSettings().apiBaseUrl}/${dioParam.path}'
        : dioParam.fullPath;

    dio = Dio(
      BaseOptions(
        method: dioParam.method,
        headers: {
          ...headerDefault,
          ...dioParam.header,
        },
      ),
    );

    addInterceptors();

    Response response;

    switch (dioParam.method) {
      case TypeRequestApi.download:
        response = await dio.download(
          pathRequest,
          dioParam.paramDownload!.savePathDownload,
          options: Options(
            headers: {
              HttpHeaders.acceptEncodingHeader: '*',
            },
            followRedirects: false,
          ),
          deleteOnError: true,
          onReceiveProgress: dioParam.paramDownload!.onReceiveProgress,
          cancelToken: dioParam.paramDownload!.cancelTaskUpDownload,
        );
        break;
      case TypeRequestApi.upload:
        response = await dio.request(
          pathRequest,
          data: dioParam.body,
          queryParameters: dioParam.queryParameters,
          onReceiveProgress: dioParam.paramUpload!.onReceiveProgress,
          cancelToken: dioParam.paramUpload!.cancelTaskUpDownload,
        );
        break;
      default:
        response = await dio.request(
          pathRequest,
          data: dioParam.body,
          queryParameters: dioParam.queryParameters,
        );
        break;
    }

    response = await dio.request(
      pathRequest,
      data: dioParam.body,
      queryParameters: dioParam.queryParameters,
    );

    return response;
  }

  Dio addInterceptors() {
    return dio
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) => requestInterceptor(options, handler),
          onResponse: (response, handler) =>
              responseInterceptor(response, handler),
          onError: (dioError, handler) => errorInterceptor(dioError, handler),
        ),
      );
  }

  Future<void> requestInterceptor(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    return handler.next(options);
  }

  Future<void> responseInterceptor(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    return handler.next(response);
  }

  Future<void> errorInterceptor(
    DioError e,
    ErrorInterceptorHandler handler,
  ) async {
    return handler.next(e);
  }
}

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
    this.method = TypeRequestApi.get,
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
