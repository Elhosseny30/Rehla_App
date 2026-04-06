import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/core/Routes/GoRouter.dart';
import 'package:graduationproject/core/utils/DioHelper.dart';
import 'package:graduationproject/features/auth/presentation/cubit/care_giver_Register/cubit/care_giver_register_cubit.dart';
import 'package:graduationproject/features/auth/presentation/cubit/doctorRegister/doctor_register_cubit.dart';
import 'package:graduationproject/features/auth/presentation/cubit/patientRegister/patient_register_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PatientRegisterStateCubit()),
        BlocProvider(create: (context) => DoctorRegisterCubit()),
        BlocProvider(create: (context) => CareGiverRegisterCubit()),
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
