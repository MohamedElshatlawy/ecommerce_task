import 'package:ecommerceapp/core/data/api/app_api.dart';
import 'package:ecommerceapp/core/data/repository/auth_repository.dart';
import 'package:ecommerceapp/core/data/repository/products_repository.dart';
import 'package:ecommerceapp/features/screens/auth/cubit/auth_cubit.dart';
import 'package:ecommerceapp/features/screens/home/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<AuthCubit>(
                create: (BuildContext context) =>
                    AuthCubit(authRepository: AuthRepository(Api()))
                      ..getUserInfo(),
              ),
              BlocProvider<ProductsCubit>(
                create: (BuildContext context) =>
                    ProductsCubit(productRepository: ProductRepository(Api()))
                      ..getAllProducts(),
              ),
            ],
            child: MaterialApp(
              builder: (context, widget) {
                //add this line
                ScreenUtil.init(context);
                return MediaQuery(
                  //Setting font does not change with system font size
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget!,
                );
              },
              title: AppStrings.appName,
              debugShowCheckedModeBanner: false,
              theme: appTheme(),
              onGenerateRoute: AppRoutes.onGenerateRoutes,
            ),
          );
        });
  }
}
