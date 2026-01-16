import 'package:go_router/go_router.dart';
import 'package:graduationproject/core/routes/appRoutes.dart';
import 'package:graduationproject/features/auth/presentation/screens/login.dart';
import 'package:graduationproject/features/onboarding/presentation/screens/onboardingscreen.dart';
import 'package:graduationproject/homeScreen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.splash, 
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.homeScreen,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.onBoardingScreen,
      builder: (context, state) => OnBoardingScreen(),
    ),
    GoRoute(
      path: AppRoutes.login, 
      builder: (context, state) => LoginScreen(),
    ),
  ],
);


