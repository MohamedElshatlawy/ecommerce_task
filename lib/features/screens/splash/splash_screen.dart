import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/cache_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  GlobalKey<ScaffoldMessengerState> _globalKey = GlobalKey();
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () async {
      final bool isToken = CacheHelper.getData(key: 'token') != null;
      isToken
          ? Navigator.pushReplacementNamed(context, Routes.layoutScreen)
          : Navigator.pushReplacementNamed(context, Routes.loginScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _globalKey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            AppImages.appLogo,
            height: 150.h,
            width: 200.w,
          ),
          SizedBox(height: 20.h),
          Text(
            AppStrings.appName,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24.0,
                fontFamily: AppStrings.fontFamily,
                color: AppColors.primeryColor,
                letterSpacing: 2,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
