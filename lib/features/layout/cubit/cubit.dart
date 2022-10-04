import 'package:ecommerceapp/features/layout/cubit/states.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens/home/add_product/add_product.dart';
import '../../screens/home/home_screen/home_screen.dart';
import '../../screens/home/profile/profile_screen.dart';

class AppLayoutCubit extends Cubit<AppLayoutStates> {
  AppLayoutCubit() : super(AppLayoutInitalState());

  static AppLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    AddProductScreen(),
    const ProfileScreen(),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    //if (currentIndex == 1) getSports();
    // if (currentIndex == 2) getScience();
    // emit(NewsNavBottomState());
    emit(AppLayoutChangBottomNavState());
  }
}
