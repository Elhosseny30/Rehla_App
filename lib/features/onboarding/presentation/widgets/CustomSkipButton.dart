import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduationproject/core/Routes/appRoutes.dart';
import 'package:graduationproject/core/constants/colors.dart';

class CustomSkipButton extends StatelessWidget {
  const CustomSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 8),
      child: ElevatedButton(
        onPressed: () {
          //Navigator.pushReplacementNamed(context,LoginScreen.id);
          context.go(AppRoutes.login);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.whiteColor,
          side: BorderSide(width: 1.5, color: MyColors.mainColor),
          padding: EdgeInsets.only(top: 2, right: 8, bottom: 2, left: 8),
          minimumSize: Size(200, 50),
          alignment: Alignment.center,
        ),
        child: Text(
          "Skip",
          style: TextStyle(
            fontSize: 24,
            color: MyColors.mainColor,
            fontFamily: 'Satoshi',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
