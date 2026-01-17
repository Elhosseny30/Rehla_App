import 'package:go_router/go_router.dart';
import 'package:graduationproject/core/routes/appRoutes.dart';
import 'package:graduationproject/features/auth/presentation/screens/doctor.dart';
import 'package:graduationproject/features/auth/presentation/screens/forgetPassword.dart';
import 'package:graduationproject/features/auth/presentation/screens/login.dart';
import 'package:graduationproject/features/auth/presentation/screens/patientCareGiverScreen.dart';
import 'package:graduationproject/features/auth/presentation/screens/signUp.dart';
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
    GoRoute(
      path: AppRoutes.forgetPassword, 
      builder: (context, state) => ForgetPassword(),
    ),
    GoRoute(
      path: AppRoutes.signUp,
      builder: (context, state) => SignUp(),
    ),
    GoRoute(
      path: AppRoutes.patientCareGiverScreen,
      builder: (context, state) => PatientCareGiverScreen(),
    ),
    GoRoute(
      path: AppRoutes.doctorScreen,
      builder: (context, state) => DoctorScreen(),
    ),
  ],
);


