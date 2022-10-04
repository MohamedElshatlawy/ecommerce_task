import 'package:ecommerceapp/core/data/api/app_api.dart';
import 'package:ecommerceapp/core/data/repository/auth_repository.dart';
import 'package:ecommerceapp/features/screens/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_strings.dart';
import '../../features/layout/app_layout.dart';
import '../../features/layout/cubit/cubit.dart';

import '../../features/screens/auth/login/login_screen.dart';
import '../../features/screens/auth/regester/register_view.dart';
import '../../features/screens/home/details_product/product_details.dart';
import '../../features/screens/splash/splash_screen.dart';

class Routes {
  static const String initalRoutes = '/';
  static const String loginScreen = '/login-screen';
  static const String registerScreen = '/register-screen';
  static const String layoutScreen = '/layout-screen';
  static const String detailsScreen = '/productdetails-screen';
}

class AppRoutes {
  static Route? onGenerateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initalRoutes:
        return MaterialPageRoute(builder: (ctx) => const SplashScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (ctx) => LoginScreen(),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (ctx) => RegisterScreen(),
        );
      // case Routes.detailsScreen:
      //   return MaterialPageRoute(
      //     builder: (ctx) => const ProductDetailsScreen(),
      //   );
      case Routes.layoutScreen:
        return MaterialPageRoute(
          builder: (ctx) => BlocProvider(
            create: (context) => AppLayoutCubit(),
            child: const AppLayout(),
          ),
        );
      default:
        return undefiendRoute();
    }
  }

  static Route<dynamic> undefiendRoute() {
    return MaterialPageRoute(
        builder: (ctx) => const Scaffold(
              body: Center(
                child: Text(
                  AppStrings.noPageFound,
                  style: TextStyle(color: Colors.red, fontSize: 25),
                ),
              ),
            ));
  }
}
