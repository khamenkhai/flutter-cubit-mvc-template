import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:project_frame/core/local_data/shared_prefs.dart';

class DioClient {
  
  final SharedPref sharedPref;
  final Dio dio;

  DioClient({required this.sharedPref, required this.dio});

  /// Common request headers
  Future<Map<String, String>> _getHeaders() async {
    String? token = await sharedPref.getString(key: sharedPref.bearerToken);
    return {'Authorization': 'Bearer $token'};
  }

  /// GET Request - fixed version
  Future<Response<T>> getRequest<T>({
    required String apiUrl,
    Map<String, String>? queryParams,
    Map<String, String>? headers,
  }) async {
    try {
      final defaultHeaders = await _getHeaders();
      return await dio.get<T>(
        apiUrl,
        queryParameters: queryParams, // Correct place for query params
        options: Options(
          headers: {
            ...defaultHeaders,
            ...?headers
          }, // Merge default and custom headers
          receiveDataWhenStatusError: true,
          validateStatus: (status) => true,
        ),
      );
    } on DioException catch (e) {
      throw Exception(e);
    }
  }



  /// GET Request with Cache Interceptor
  Future<Response<T>> getRequest2<T>({required String apiUrl}) async {
    try {
      final headers = await _getHeaders();
      DioCacheInterceptor dioCacheInterceptor = DioCacheInterceptor(
        options: CacheOptions(
          store: MemCacheStore(),
        ),
      );
      dio.interceptors.add(dioCacheInterceptor);
      return await dio.get<T>(
        apiUrl,
        options: Options(
          headers: headers,
          receiveDataWhenStatusError: true,
          validateStatus: (status) => true,
        ),
      );
    } on DioException catch (e) {
      throw Exception(e);
    }
  }

  /// POST Request
  Future<Response<T>> postRequest<T>({
    required String apiUrl,
    required Map<String, dynamic> requestBody,
  }) async {
    try {
      final headers = await _getHeaders();
      return await dio.post<T>(
        apiUrl,
        data: requestBody,
        options: Options(
          headers: headers,
          receiveDataWhenStatusError: true,
          validateStatus: (status) => true,
        ),
      );
    } on DioException catch (e) {
      throw Exception(e);
    }
  }

  /// POST Request with Custom Header
  Future<Response<T>> postRequestWithCustomHeader<T>({
    required String apiUrl,
    required Map<String, dynamic> requestBody,
    required Map<String, dynamic> header,
  }) async {
    try {
      return await dio.post<T>(
        apiUrl,
        data: requestBody,
        options: Options(headers: header),
      );
    } on DioException catch (e) {
      throw Exception(e);
    }
  }

  /// DELETE Request
  Future<Response<T>> deleteRequest<T>({
    required String apiUrl,
    required Map<String, dynamic> requestBody,
  }) async {
    try {
      final headers = await _getHeaders();
      return await dio.delete<T>(
        apiUrl,
        data: requestBody,
        options: Options(headers: headers),
      );
    } on DioException catch (e) {
      throw Exception(e);
    }
  }

  /// PUT Request
  Future<Response<T>> putRequest<T>({
    required String apiUrl,
    required Map<String, dynamic> requestBody,
  }) async {
    try {
      final headers = await _getHeaders();
      return await dio.put<T>(
        apiUrl,
        data: requestBody,
        options: Options(headers: headers),
      );
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
