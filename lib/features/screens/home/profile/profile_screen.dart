import 'dart:async';

import 'package:ecommerceapp/config/routes/app_routes.dart';
import 'package:ecommerceapp/core/utils/app_colors.dart';
import 'package:ecommerceapp/core/utils/app_strings.dart';
import 'package:ecommerceapp/core/utils/cache_helper.dart';
import 'package:ecommerceapp/features/screens/auth/cubit/auth_cubit.dart';
import 'package:ecommerceapp/features/screens/home/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   AuthCubit.get(context).getUserInfo();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.profileTitle),
        centerTitle: true,
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return cubit.userInfoModel != null
              ? Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        cubit.userInfoModel!.user!.fullName!,
                        style: const TextStyle(
                            fontFamily: AppStrings.fontFamily, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        cubit.userInfoModel!.user!.email!,
                        style: const TextStyle(
                            fontFamily: AppStrings.fontFamily, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () async {
                          await CacheHelper.removeData(key: "token");
                          ProductsCubit.get(context).productModel = null;
                          Timer(const Duration(seconds: 1), () async {
                            Navigator.popAndPushNamed(
                                context, Routes.loginScreen);
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.logout,
                              color: Colors.red,
                            ),
                            Text(
                              "Logout",
                              style: TextStyle(
                                  fontFamily: AppStrings.fontFamily,
                                  color: Colors.red,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.purple,
                  ),
                );
        },
      ),
    );
  }
}
