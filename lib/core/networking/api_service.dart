import 'package:dio/dio.dart';
import 'api_paths.dart';

class ApiService {
  static const String urlencodedType = 'application/x-www-form-urlencoded';
  static const String jsonType = 'application/json';
  static const String multiPart = "multipart/form-data";
  static const int unauthorizedCode = 401;
  static const int internalServerErrorCode = 500;
  static const String authorizationParameter = 'Authorization';
  static const String bearer = 'Test_';

  static Dio dio = Dio(BaseOptions(
    baseUrl: ApiPaths.base,
    receiveDataWhenStatusError: true,
    validateStatus: (status) => true,
  ));

  /// Post api
  // static Future<Response<T>> postApi<T>(
  //   String path, {
  //   Map<String, dynamic>? body,
  //   Map<String, dynamic>? params,
  //   FormData? formData,
  //   bool isAuth = true,
  //   bool isRefresh = false,
  // }) async {
  //   assert(!(body != null && formData != null),
  //       "Both 'body' and 'formData' should not be provided at the same time.");

  //   //call api
  //   try {
  //     if (isAuth) {
  //       await authorize(isRefresh: isRefresh);
  //     }

  //     final Response<T> response = await dio.post(
  //       path,
  //       queryParameters: params,
  //       data: body ?? formData,
  //       options: Options(
  //         contentType: formData != null ? multiPart : jsonType,
  //         validateStatus: (int? status) {
  //           if (status == 401) return false;
  //           return true;
  //         },
  //       ),
  //     );
  //     isTokenExpired(response);
  //     return response;
  //   } on DioException catch (e) {
  //     print(e);
  //     throw Exception(e.message);
  //   }
  // }

  /// Get api
  static Future<Response<T>> getApi<T>(String path,
      {Map<String, dynamic>? params}) async {
    // authorize the api
    try {
      // await authorize();

      final Response<T> response = await dio.get(path, queryParameters: params,
          options: Options(validateStatus: (int? status) {
        if (status == 401 || status == 403) return false;
        return true;
      }));
      // isTokenExpired(response);
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  // static Future<void> authorize({bool isRefresh = false}) async {
  //   final String? token = AuthRepository.accessToken;
  //   dio.options.headers[authorizationParameter] = '$bearer$token';
  // }

  // static Future<Response<T>> putApi<T>(
  //   String path, {
  //   Map<String, dynamic> body = const {},
  //   bool isJson = true,
  //   bool isAuth = true,
  //   bool isRefresh = false,
  // }) async {
  //   //call api
  //   if (isAuth) {
  //     await authorize(isRefresh: isRefresh);
  //   }

  //   final Response<T> response = await dio.put(path,
  //       data: body,
  //       options: Options(
  //           contentType: isJson ? jsonType : urlencodedType,
  //           validateStatus: (int? status) {
  //             // if (status == 401) return false;
  //             return true;
  //           }));
  //   isTokenExpired(response);
  //   return response;
  // }

  // static isTokenExpired(Response response) {
  //   final msg = response.data?['msgError'];
  //   if (msg != null && msg == 'jwt expired') {
  //     DialogWidget.dialog(text: 'Your session has expired, please log in again', login: true);
  //   }
  // }

  // static Future<Response<T>> patchApi<T>(
  //   String path, {
  //   Map<String, dynamic>? body,
  //   FormData? formData,
  //   bool isJson = true,
  //   bool isAuth = true,
  //   bool isRefresh = false,
  // }) async {
  //   assert(!(body != null && formData != null),
  //       "Both 'body' and 'formData' should not be provided at the same time.");

  //   //call api
  //   try {
  //     if (isAuth) {
  //       await authorize(isRefresh: isRefresh);
  //     }

  //     final Response<T> response = await dio.patch(
  //       path,
  //       data: body ?? formData,
  //       options: Options(
  //         contentType: formData != null ? multiPart : jsonType,
  //         validateStatus: (int? status) {
  //           if (status == 401) return false;
  //           return true;
  //         },
  //       ),
  //     );
  //     isTokenExpired(response);
  //     return response;
  //   } on DioException catch (e) {
  //     print(e);
  //     throw Exception(e.message);
  //   }
  // }

  //   static Future<Response<T>> deleteApi<T>(
  //   String path, {
  //   Map<String, dynamic>? body,
  //   Map<String, dynamic>? params,
  //   FormData? formData,
  //   bool isAuth = true,
  //   bool isRefresh = false,
  // }) async {
  //   assert(!(body != null && formData != null),
  //       "Both 'body' and 'formData' should not be provided at the same time.");

  //   //call api
  //   try {
  //     if (isAuth) {
  //       await authorize(isRefresh: isRefresh);
  //     }

  //     final Response<T> response = await dio.delete(
  //       path,
  //       queryParameters: params,
  //       data: body ?? formData,
  //       options: Options(
  //         contentType: formData != null ? multiPart : jsonType,
  //         validateStatus: (int? status) {
  //           if (status == 401) return false;
  //           return true;
  //         },
  //       ),
  //     );
  //     isTokenExpired(response);
  //     return response;
  //   } on DioException catch (e) {
  //     print(e);
  //     throw Exception(e.message);
  //   }
  // }
}
