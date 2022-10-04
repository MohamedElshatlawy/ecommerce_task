//import 'package:ecommerceapp/features/screens/auth/domain/usecases/Auth_usecase.dart';
import 'package:ecommerceapp/config/routes/app_routes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/model/auth_model.dart';
import '../../../../core/data/model/user_info_Model.dart';
import '../../../../core/data/repository/auth_repository.dart';
import '../../../../core/utils/cache_helper.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository}) : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  final AuthRepository authRepository;
  UserModel? userModel;
  Future<void> register(BuildContext context,
      {required String email,
      required String password,
      required String fullName}) async {
    emit(Registering());
    authRepository
        .registerUser(email: email, password: password, fullName: fullName)
        .then((value) {
      if (value.status == 200) {
        userModel = value;
        CacheHelper.saveData(key: 'token', value: userModel!.token);
        emit(RegisteredSuccessfully());
        Navigator.pushReplacementNamed(context, Routes.layoutScreen);
      }
    }).catchError((e) {
      print(e.toString());
      emit(Registerfailed());
    });
  }

  Future<void> login(BuildContext context,
      {required String email, required String password}) async {
    emit(Logging());
    authRepository.loginUser(email: email, password: password).then((value) {
      if (value.status == 200) {
        userModel = value;
        CacheHelper.saveData(key: 'token', value: userModel!.token);
        emit(LoggedSuccessfully());
        Navigator.pushReplacementNamed(context, Routes.layoutScreen);
      }
    }).catchError((e) {
      print("plpl->${e.toString()}");
      emit(Loginfailed());
    });
  }

  UserInfoModel? userInfoModel;
  Future<void> getUserInfo() async {
    emit(UserDataLoading());
    authRepository.getUser().then((value) {
      if (value.status == 200) {
        userInfoModel = value;

        emit(UserDataLoaded());
      }
    }).catchError((e) {
      print(e.toString());
      emit(UserDataError());
    });
  }
}
