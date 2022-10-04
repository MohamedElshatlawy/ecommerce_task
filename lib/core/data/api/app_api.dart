import 'package:dio/dio.dart';
import 'package:ecommerceapp/core/data/api/end_points.dart';

import '../../utils/cache_helper.dart';

class Api {
  Dio? dio;
  static Map headers = <String, dynamic>{};
  Api() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: EndPoints.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, //20second ,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(baseOptions);
  }

  loginUser({
    required String email,
    required String password,
  }) async {
    try {
      dio!.options.headers = {
        'Accept': 'application/json',
      };

      Response response = await dio!.post(EndPoints.loginUser,
          data: {"email": email, "password": password});
      print('Data -> ${response.data.toString()}');

      return response.data;
    } catch (e) {
      print('${e.toString()}');
      return [];
    }
  }

  registerUser({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      dio!.options.headers = {
        'Accept': 'application/json',
      };

      Response response = await dio!.post(EndPoints.registerUser,
          data: {"fullName": fullName, "email": email, "password": password});
      print('Data -> ${response.data.toString()}');

      return response.data;
    } catch (e) {
      print('${e.toString()}');
      return [];
    }
  }

  getUserInfo() async {
    try {
      dio!.options.headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
      };
      Response response = await dio!.get(
        EndPoints.getUser,
      );
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print('${e.toString()}');
      return [];
    }
  }

  getAllProducts() async {
    try {
      dio!.options.headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
      };
      Response response = await dio!.get(
        EndPoints.getAllProducts,
      );

      print("data--${response.data.toString()}");
      return response.data;
    } catch (e) {
      return [];
    }
  }

  getOneProducts({required String id}) async {
    try {
      dio!.options.headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
      };
      Response response = await dio!.get(
        EndPoints.getOneProduct + id,
      );

      print("dataOfOneProduct--${response.data.toString()}");
      return response.data;
    } catch (e) {
      return [];
    }
  }

  addProduct({
    required String productName,
    required List<Map<String, dynamic>> colorImage,
    required List<Map<String, dynamic>> baseVariations,
    required List<String> productSize,
  }) async {
    try {
      dio!.options.headers = {
        'Accept': 'application/json',
        Headers.contentTypeHeader: "multipart/form-data",
        'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
      };
      FormData data = FormData.fromMap({
        'productName': productName,
        'productSizes': productSize,
        "productColors": colorImage,
        "productVariations": baseVariations,
      });
      final Response response = await dio!.post(
        EndPoints.addProduct,
        data: data,
      );

      return response.data;
    } catch (e, s) {
      print('error:$e');
      print('error:$s');
      return [];
    }
  }
}
