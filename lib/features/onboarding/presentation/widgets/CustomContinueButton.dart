import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduationproject/core/Routes/appRoutes.dart';
import 'package:graduationproject/features/onboarding/data/repo/onBoardingData.dart';
import 'package:graduationproject/features/onboarding/presentation/cubit/on_boarding_cubit_cubit.dart';

class CustomContinueButton extends StatelessWidget {
  const CustomContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ElevatedButton(
        onPressed: () {
          if (BlocProvider.of<OnBoardingCubit>(context).currentPageNumber ==
              OnBoardingListDat.length - 1) {
            //Navigator.pushReplacementNamed(context, LoginScreen.id);
            context.go(AppRoutes.login);
          } else {
            BlocProvider.of<OnBoardingCubit>(context).getContinueButton();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xffFF48A4),
          padding: EdgeInsets.only(top: 2, right: 8, bottom: 2, left: 8),
          minimumSize: Size(200, 50),
          alignment: Alignment.center,
        ),
        child: Text(
          "Continue",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontFamily: 'Satoshi',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
