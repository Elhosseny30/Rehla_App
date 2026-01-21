import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/core/Routes/GoRouter.dart';
import 'package:graduationproject/features/auth/presentation/cubit/patientRegister/patient_register_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PatientRegisterStateCubit()),
      ],
      child: RehlaApp(),
    ),
  );
}

class RehlaApp extends StatelessWidget {
  const RehlaApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   initialRoute: '/',

    //   routes: {
    //     '/':(context)=> Splash(),
    //     '/homeScreen':(context)=>HomeScreen(),
    //     '/onBoardingScreen':(context)=> OnBoardingScreen(),
    //     '/login':(context) => LoginScreen(),
    //   },
    // );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
