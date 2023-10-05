import 'package:dio/dio.dart';
import 'package:my_app/shared/my_shared.dart';
import 'package:my_app/util/app_const.dart';

class ApiService {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: AppConst.baseUrl, receiveDataWhenStatusError: true));
  }

  Future<Response> post({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await dio.post(endpoint,
        queryParameters: queryParameters ?? {"": ""},
        options: Options(headers: {
                    'Accept': "application/json",

          "Authorization":
              'Bearer ${MySharedPrefrence.get(key: AppConst.token) ?? ""}'
        },),);
    return response;
  }

  Future<Response> get({
    required String endpoint,
  }) async {
    return await dio.get(
      endpoint,
      options: Options(
        headers: {
          'Accept': "application/json",
          "Authorization":
              'Bearer ${MySharedPrefrence.get(key: AppConst.token) ?? ""}'
        },
      ),
    );
    //   return response;
  }
}
