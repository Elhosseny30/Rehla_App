import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomElevatedButton.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomTextField.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomTitleTextFormField.dart';
import 'package:graduationproject/features/auth/presentation/widgets/Custom_Back_Translate_Button.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(height: 40),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: CustomBackTranslateButton(
                          selectedNumber: null,
                          iconSize: 35,
                          width: 100,
                          height: 60,
                          icon: Icons.arrow_back_ios_new,
                          // TODO
                          onTap: () {
                            context.pop();
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
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
                    ),
                  ],
                ),
                SizedBox(height: 70),
                CustomWelcomeTextWidget(
        
                  text: "Forget your password?",size: 25,
                  fontWeight: FontWeight.w500,
                  color: MyColors.mainColor,
                  ),
                SizedBox(height: 100),
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
                    return null;
                  },
                ),
                SizedBox(height: 75),
                CustomElevatedButton(
                  isSignUpLoginDesign: false,
                  selectedNumber: null,
                  text: "Send mail", onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
