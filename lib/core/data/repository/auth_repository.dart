import '../model/auth_model.dart';

import '../api/app_api.dart';
import '../model/user_info_Model.dart';

class AuthRepository {
  final Api api;

  AuthRepository(this.api);

  Future<UserModel> registerUser({
    required String fullName,
    required String email,
    required String password,
  }) async {
    final userRegister = await api.registerUser(
        email: email, fullName: fullName, password: password);

    return UserModel.fromJson(userRegister);
  }

  Future<UserModel> loginUser({
    required String email,
    required String password,
  }) async {
    final loginUser = await api.loginUser(email: email, password: password);

    return UserModel.fromJson(loginUser);
  }

  Future<UserInfoModel> getUser() async {
    final userInfo = await api.getUserInfo();

    return UserInfoModel.fromJson(userInfo);
  }
}
