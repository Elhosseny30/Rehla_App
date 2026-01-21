import 'package:go_router/go_router.dart';
import 'package:graduationproject/core/routes/appRoutes.dart';
import 'package:graduationproject/features/auth/presentation/screens/SetUpPassword.dart';
import 'package:graduationproject/features/auth/presentation/screens/doctorScreens/doctor.dart';
import 'package:graduationproject/features/auth/presentation/screens/doctorScreens/infoDoctor.dart';
import 'package:graduationproject/features/auth/presentation/screens/doctorScreens/infoDoctorIDNational.dart';
import 'package:graduationproject/features/auth/presentation/screens/forgetPassword.dart';
import 'package:graduationproject/features/auth/presentation/screens/login.dart';
import 'package:graduationproject/features/auth/presentation/screens/patientScreens/hell.dart';
import 'package:graduationproject/features/auth/presentation/screens/patientScreens/infoPatientCareGiverScreen.dart';
import 'package:graduationproject/features/auth/presentation/screens/patientScreens/infoPatientCareGiverTwo.dart';
import 'package:graduationproject/features/auth/presentation/screens/patientScreens/patientCareGiverScreen.dart';
import 'package:graduationproject/features/auth/presentation/screens/signUp.dart';
import 'package:graduationproject/features/onboarding/presentation/screens/onboardingscreen.dart';
import 'package:graduationproject/homeScreen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: AppRoutes.splash, builder: (context, state) => LoginScreen()),
    GoRoute(
      path: AppRoutes.homeScreen,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.onBoardingScreen,
      builder: (context, state) => OnBoardingScreen(),
    ),
    GoRoute(path: AppRoutes.login, builder: (context, state) => LoginScreen()),
    GoRoute(
      path: AppRoutes.forgetPassword,
      builder: (context, state) => ForgetPassword(),
    ),
    GoRoute(path: AppRoutes.signUp, builder: (context, state) => SignUp()),
    GoRoute(
      path: AppRoutes.patientCareGiverScreen,
      builder: (context, state) => PatientCareGiverScreen(),
    ),
    GoRoute(
      path: AppRoutes.doctorScreen,
      builder: (context, state) => DoctorScreen(),
    ),
    GoRoute(
      path: AppRoutes.infoDoctorScreen,
      builder: (context, state) => InfoDoctor(),
    ),
    GoRoute(
      path: AppRoutes.infoPatientCareGiverScreen,
      builder: (context, state) => InfoPatientCareGiverScreen(),
    ),
    GoRoute(
      path: AppRoutes.infoPatientCareGiverTwo,
      builder: (context, state) => InfoPatientCareGiverTwo(),
    ),
    GoRoute(
      path: AppRoutes.infoDoctorNationalID,
      builder: (context, state) => InfoDoctorNationalID(),
    ),
    GoRoute(
      path: AppRoutes.setupPassword,
      builder: (context, state) => SetupPassword(),
    ),
    GoRoute(
      path: AppRoutes.hekkoo,
      builder: (context, state) {
        final username = state.extra as String? ?? "Patient";
        return hekko(name: username);
      },
    ),
  ],
);
