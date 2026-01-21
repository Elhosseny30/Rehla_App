import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduationproject/core/routes/appRoutes.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomBuildSocailIcon.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomElevatedButton.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomInkWellSignUp.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomTextField.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomTitleTextFormField.dart';
import 'package:graduationproject/features/auth/presentation/widgets/Custom_Back_Translate_Button.dart';
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
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomBackTranslateButton(
                    selectedNumber: null,
                    iconSize: 35,
                    width: 100,
                    height: 60,
                    icon: Icons.translate,
                    // TODO
                    onTap: () {},
                  ),
                ),
                SizedBox(height: 35),
                CustomWelcomeTextWidget(
            
                  text: "Welcome Home",size: 30,
                  fontWeight: FontWeight.w500,
                  color: MyColors.mainColor,
                  ),
                SizedBox(height: 60),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTitleTextFormField(title: "Email / Username"),
                    SizedBox(height: 10),
                    CustomTextField(
                      selectedNumber: null,
                      tappedEnableBorder: false,
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
                      selectedNumber: null,
                      validator: (value){},
                      tappedEnableBorder: false,
                      hintText: "*****************",
                      isPassword: true,
                      controller: passwordController,
                    ),
                    //TODO
                    Align(
                      alignment: Alignment.centerRight,
                      child: CustomInkWellSignUp(
                        text: "forget password", 
                        onTap: (){
                          context.push(AppRoutes.forgetPassword);
                        }, 
                        selectedNumber: null),
                    ),
                    // CustomInkWell(
                    //   text: "forget password",
                    //   onTap: () {
                    //     context.push(AppRoutes.forgetPassword);
                    //   },
                    // ),
                    SizedBox(height: 40),

                    //TODO
                    CustomElevatedButton(
                      isSignUpLoginDesign: false,
                      selectedNumber: null,
                      text: "Log in", onPressed: () {}),
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
                          icon: Icon(
                            Icons.apple,
                            color: Colors.black,
                            size: 30,
                          ),
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
                        CustomWelcomeTextWidget(
                     
                          text: "Don't have an account? ", size: 15, fontWeight: FontWeight.w400, color: MyColors.blackColor),
                        CustomInkWellSignUp(
                          selectedNumber: null,
                          text: "Sign Up", onTap: () {
                          context.push(AppRoutes.signUp);
                        }),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
