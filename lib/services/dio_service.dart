// Cores
import 'dart:io';
import 'package:dio/dio.dart';
// Models
import 'package:flutter_bloc_boilerplate/models/dio_param.dart';
// Services
import 'package:flutter_bloc_boilerplate/services/flavor_settings_service.dart';
// Utils
import 'package:flutter_bloc_boilerplate/utils/constants/api_resource.dart';

class DioService {
  static final DioService _singleton = DioService._internal();

  factory DioService() {
    return _singleton;
  }

  DioService._internal();

  late Dio dio;

  Future dioService(DioParam dioParam) async {
    // Validation parameter
    assert(dioParam.fullPath.isNotEmpty && dioParam.path.isNotEmpty);
    assert(
      dioParam.method == ApiResource.download && dioParam.paramDownload == null,
      dioParam.method == ApiResource.upload && dioParam.paramUpload == null,
    );

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
      case ApiResource.download:
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
      case ApiResource.upload:
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

    return response;
  }

  Dio addInterceptors() {
    return dio
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, _) => requestInterceptor(options),
          onResponse: (response, _) => responseInterceptor(response),
          onError: (dioError, _) => errorInterceptor(dioError),
        ),
      );
  }

  Future<RequestOptions> requestInterceptor(RequestOptions options) async {
    return options;
  }

  Future<Response> responseInterceptor(Response response) async {
    return response;
  }

  Future<DioError> errorInterceptor(DioError err) async {
    return err;
  }
}
