import 'package:flutter/material.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomBuildSocailIcon.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomElevatedButton.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomInkWell.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomInkWellSignUp.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomTextField.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomTitleTextFormField.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomTranslateButton.dart';
import 'package:graduationproject/features/auth/presentation/widgets/OrCointinueWithWidget.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: [
              SizedBox(height: 40),
              CustomTranslateButton(),
              SizedBox(height: 35),
              CustomWelcomeTextWidget(),
              SizedBox(height: 60),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTitleTextFormField(title: "Email / Username"),
                  SizedBox(height: 10),
                  CustomTextField(
                    hintText: "Example@example.com",
                    isPassword: false,
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This Field is required";
                      }
                      bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      ).hasMatch(value);
                      if (!emailValid) {
                        return "ًWrong Email";
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  CustomTitleTextFormField(title: "Password"),
                  SizedBox(height: 10),
                  CustomTextField(
                    hintText: "*****************",
                    isPassword: true,
                    controller: passwordController,
                  ),
                  //TODO
                  CustomInkWell(text: "forget password", onTap: () {}),
                  SizedBox(height: 40),

                  //TODO
                  CustomElevatedButton(text: "Log in", onPressed: () {}),
                  SizedBox(height: 25),
                  OrContinueWithWidget(text: "or continue with"),

                  SizedBox(height: 20),
                  /* *************  Social media *************** */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomBuildSocialIcon(
                        onTap: () {},
                        icon: Icon(
                          Icons.facebook,
                          color: Colors.blue,
                          size: 30,
                        ),
                      ),

                      const SizedBox(width: 15),

                      CustomBuildSocialIcon(
                        onTap: () {},
                        icon: Icon(
                          Icons.g_mobiledata,
                          color: Colors.red,
                          size: 35,
                        ),
                      ),

                      const SizedBox(width: 15),

                      CustomBuildSocialIcon(
                        onTap: () {},
                        icon: Icon(Icons.apple, color: Colors.black, size: 30),
                      ),

                      const SizedBox(width: 15),

                      CustomBuildSocialIcon(
                        onTap: () {},

                        icon: Icon(
                          Icons.fingerprint,
                          color: Colors.pinkAccent,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
/* ********************************************  */
                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      CustomInkWellSignUp(text: "Sign Up",onTap: (){},)
                      
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
