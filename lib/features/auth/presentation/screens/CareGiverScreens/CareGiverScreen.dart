import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduationproject/core/routes/appRoutes.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/core/utils/functions.dart';
import 'package:graduationproject/features/auth/presentation/cubit/care_giver_Register/cubit/care_giver_register_cubit.dart';
import 'package:graduationproject/features/auth/presentation/cubit/patientRegister/patient_register_cubit.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomBuildSocailIcon.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomElevatedButton.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomInkWellSignUp.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomTextField.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomTitleTextFormField.dart';
import 'package:graduationproject/features/auth/presentation/widgets/Custom_Back_Translate_Button.dart';
import 'package:graduationproject/features/auth/presentation/widgets/DotsWidgets.dart';
import 'package:graduationproject/features/auth/presentation/widgets/OrCointinueWithWidget.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';

class CareGiverScreen extends StatelessWidget {
  CareGiverScreen({super.key});
  final TextEditingController firstNameText = TextEditingController();
  final TextEditingController lastNameText = TextEditingController();
  final TextEditingController userName = TextEditingController();
  //final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController emailText = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {},
                          child: CustomBackTranslateButton(
                            selectedNumber: 2,
                            iconSize: 25,
                            width: 80,
                            height: 50,
                            icon: Icons.arrow_back_ios_new,
                            onTap: () {
                              context.pop();
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: CustomWelcomeTextWidget(
                          fontWeight: FontWeight.w500,
                          color: MyColors.greenColor,

                          text: "New Account",
                          size: 20,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: CustomBackTranslateButton(
                          selectedNumber: 2,
                          iconSize: 25,
                          width: 80,
                          height: 50,
                          icon: Icons.translate,
                          // TODO
                          onTap: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                DotsWidget(currentPage: 1, selectedNumber: 2),

                SizedBox(height: 50),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: CustomTitleTextFormField(
                              title: "First name",
                            ),
                          ),
                          SizedBox(height: 10),
                          CustomTextField(
                            selectedNumber: 2,
                            validator: (value) {
                              return AuthAppFunctions().isEmptyNull(value);
                            },
                            tappedEnableBorder: true,
                            hintText: '',
                            isPassword: false,
                            controller: firstNameText,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: CustomTitleTextFormField(title: "Last name"),
                          ),
                          SizedBox(height: 10),
                          CustomTextField(
                            selectedNumber: 2,
                            tappedEnableBorder: true,
                            hintText: '',
                            isPassword: false,
                            controller: lastNameText,
                            validator: (value) {
                              return AuthAppFunctions().isEmptyNull(value);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      CustomTitleTextFormField(title: "Username "),
                      CustomWelcomeTextWidget(
                        text: '(optional)',
                        size: 20,
                        fontWeight: FontWeight.w400,
                        color: MyColors.blackColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  selectedNumber: 2,
                  tappedEnableBorder: true,
                  hintText: '@username',
                  isPassword: false,
                  controller: userName,
                  validator: (value) {
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTitleTextFormField(title: "Email"),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  selectedNumber: 2,
                  validator: (value) {
                    return AuthAppFunctions().emailChecker(value);
                  },
                  tappedEnableBorder: true,
                  hintText: 'Example@example.com',
                  isPassword: false,
                  controller: emailText,
                ),

                SizedBox(height: 20),
                CustomWelcomeTextWidget(
                  text: "By continuing, you agree to",
                  size: 14,
                  fontWeight: FontWeight.w400,
                  color: MyColors.blackColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomWelcomeTextWidget(
                      text: "Terms of Use",
                      size: 14,
                      fontWeight: FontWeight.w400,
                      color: MyColors.greenColor,
                    ),
                    CustomWelcomeTextWidget(
                      text: " and ",
                      size: 14,
                      fontWeight: FontWeight.w400,
                      color: MyColors.blackColor,
                    ),
                    CustomWelcomeTextWidget(
                      text: "Privacy Policy.",
                      size: 14,
                      fontWeight: FontWeight.w400,
                      color: MyColors.greenColor,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CustomElevatedButton(
                  isSignUpLoginDesign: false,
                  text: "Continue",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<CareGiverRegisterCubit>(context).updateBasicsInfo(
                        email: emailText.text,
                        fName: firstNameText.text,
                        lName: lastNameText.text,
                        userName: userName.text,
                        role:2,
                        
                        );
                      (context).push(AppRoutes.infoCareGiverTwo);
                    } 
                  },
                  selectedNumber: 2,
                ),
                SizedBox(height: 20),
                OrContinueWithWidget(text: "Or fill data with"),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomBuildSocialIcon(
                      onTap: () {},
                      icon: Icon(Icons.facebook, color: Colors.blue, size: 30),
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
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomWelcomeTextWidget(
                      text: "Have an account? ",
                      size: 15,
                      fontWeight: FontWeight.w400,
                      color: MyColors.blackColor,
                    ),
                    CustomInkWellSignUp(
                      selectedNumber: 2,
                      text: "Log in",
                      onTap: () {
                        context.pushReplacement(AppRoutes.login);
                      },
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
