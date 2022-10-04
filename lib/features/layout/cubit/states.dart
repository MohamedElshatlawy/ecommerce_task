class AppLayoutStates {}

class AppLayoutInitalState extends AppLayoutStates {}

class AppLayoutChangBottomNavState extends AppLayoutStates {}

class AppHomeLoadingState extends AppLayoutStates {}

class AppHomeSuccessState extends AppLayoutStates {}

class AppHomeErrorState extends AppLayoutStates {
  final String error;

  AppHomeErrorState(this.error);
}
