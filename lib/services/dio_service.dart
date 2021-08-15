// Cores
import 'package:dio/dio.dart';
// Utils
import 'package:flutter_bloc_boilerplate/utils/constants/api_resource.dart';

class DioService {
  static final DioService _singleton = DioService._internal();

  factory DioService() {
    return _singleton;
  }

  DioService._internal();

  late Dio dio;

  Future dioService({
    String method = ApiResource.get,
  }) async {
    dio = Dio(BaseOptions(method: method));

    Response response;
    addInterceptors();

    response = await dio.request('');

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
