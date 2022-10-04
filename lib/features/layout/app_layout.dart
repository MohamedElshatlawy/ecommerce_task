import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:ecommerceapp/core/utils/app_colors.dart';
import 'package:ecommerceapp/features/layout/cubit/cubit.dart';
import 'package:ecommerceapp/features/layout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  /// Controller to handle PageView
  final _pageController = PageController();

  int maxCount = 3;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLayoutCubit, AppLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppLayoutCubit.get(context);
        return Scaffold(
          body: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
                cubit.screens.length, (index) => cubit.screens[index]),
          ),
          extendBody: true,
          bottomNavigationBar: (cubit.screens.length <= maxCount)
              ? AnimatedNotchBottomBar(
                  pageController: _pageController,
                  color: Colors.white,
                  showLabel: false,
                  bottomBarItems: [
                    BottomBarItems(
                      inActiveItem: const Icon(
                        Icons.home_filled,
                        color: Colors.blueGrey,
                      ),
                      activeItem: Icon(
                        Icons.home_filled,
                        color: AppColors.primeryColor,
                      ),
                      itemLabel: 'Page 1',
                    ),
                    BottomBarItems(
                      inActiveItem: const Icon(
                        Icons.add,
                        color: AppColors.hintColor,
                      ),
                      activeItem: Icon(
                        Icons.add,
                        color: AppColors.primeryColor,
                      ),
                      itemLabel: 'Page 2',
                    ),

                    ///svg example

                    const BottomBarItems(
                      inActiveItem: Icon(
                        Icons.person,
                        color: Colors.blueGrey,
                      ),
                      activeItem: Icon(
                        Icons.person,
                        color: Colors.yellow,
                      ),
                      itemLabel: 'Page 5',
                    ),
                  ],
                  onTap: (index) {
                    /// control your animation using page controller
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                    cubit.changeBottomNavBar(index);
                  },
                )
              : null,
        );
      },
    );
  }
}
