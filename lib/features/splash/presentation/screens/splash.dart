import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduationproject/core/Routes/appRoutes.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/core/utils/imagesAssets.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      //Navigator.pushReplacementNamed(context, '/onBoardingScreen');
      context.pushReplacement(AppRoutes.onBoardingScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Image.asset(Assets.imagesRehlatypo, width: 226, height: 141),
            // Text("powered by Rafek AI", style:
            // TextStyle(
            //   fontSize: 16,
            //   color: Color(0xffff48A4)

            // ),)
          ],
        ),
      ),
    );
  }
}
