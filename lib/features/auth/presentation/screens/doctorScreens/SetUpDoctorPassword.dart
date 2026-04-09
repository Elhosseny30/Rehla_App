import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduationproject/core/routes/appRoutes.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/core/utils/functions.dart';
import 'package:graduationproject/features/auth/presentation/cubit/doctorRegister/doctor_register_cubit.dart';
import 'package:graduationproject/features/auth/presentation/cubit/doctorRegister/doctor_register_state.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomElevatedButton.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomPasswordChecksText.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomTextField.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomTitleTextFormField.dart';
import 'package:graduationproject/features/auth/presentation/widgets/Custom_Back_Translate_Button.dart';
import 'package:graduationproject/features/auth/presentation/widgets/DotsWidgets.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';

class SetUpDoctorPassword extends StatelessWidget {
  SetUpDoctorPassword({super.key});
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController setPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorRegisterCubit, DoctorRegisterState>(
      listener: (context, state) {
        if (state.status == RegisterStatus.registerSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Account created! Redirecting to verify email..."),
              backgroundColor: Colors.green,
            ),
          );
          context.push(AppRoutes.verificationEmailDoctor);

          // context.go(AppRoutes.loginScreen);
        }

        if (state.status == RegisterStatus.failure && state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
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
                                selectedNumber: 1,
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
                              color: MyColors.blueColor,

                              text: "New Account",
                              size: 20,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: CustomBackTranslateButton(
                              selectedNumber: 1,
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
                    DotsWidget(currentPage: 4, selectedNumber: 1),
                    SizedBox(height: 15),
                    CustomWelcomeTextWidget(
                      text: "Set up your password",
                      size: 18,
                      fontWeight: FontWeight.w300,
                      color: MyColors.blackColor,
                    ),

                    SizedBox(height: 35),
                    CustomTitleTextFormField(title: "New password"),
                    SizedBox(height: 10),
                    CustomTextField(
                      hintText: "****************",
                      isPassword: true,
                      controller: setPassword,
                      validator: (value) {
                        return AuthAppFunctions().isEmptyNull(value);
                      },
                      tappedEnableBorder: true,
                      selectedNumber: 1,
                      onChanged: (value) {
                        BlocProvider.of<DoctorRegisterCubit>(
                          context,
                        ).updatePasswordValues(
                          setPassword.text,
                          confirmPassword.text,
                        );
                      },
                    ),

                    SizedBox(height: 35),
                    CustomTitleTextFormField(title: "Confirm new password"),
                    SizedBox(height: 10),
                    CustomTextField(
                      hintText: "****************",
                      isPassword: true,
                      controller: confirmPassword,
                      validator: (value) {
                        return AuthAppFunctions().isEmptyNull(value);
                      },
                      tappedEnableBorder: true,
                      selectedNumber: 1,
                      onChanged: (value) {
                        BlocProvider.of<DoctorRegisterCubit>(
                          context,
                        ).updatePasswordValues(
                          setPassword.text,
                          confirmPassword.text,
                        );
                      },
                    ),
                    SizedBox(height: 30),
                    LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(15),
                      minHeight: 12.5,
                      value: state.passwordStrength,
                      color: Color(0xffF93C6A),
                      backgroundColor: MyColors.greyRegisterColorContainer,
                    ),
                    SizedBox(height: 20),

                    CustomPasswordCheckText(
                      isValid: state.isMiniEightOrSpecialChar,
                      text:
                          "a 8 or more characters Contains a special character (@#\$%&.^*/_-)",
                    ),
                    SizedBox(height: 10),
                    CustomPasswordCheckText(
                      isValid: state.lowerUpperChars,
                      text: "Upper and lowercase letters",
                    ),
                    SizedBox(height: 10),

                    CustomPasswordCheckText(
                      isValid: state.oneNumber,
                      text: "At least one number",
                    ),
                    SizedBox(height: 10),

                    CustomPasswordCheckText(
                      isValid: state.isMatched,
                      text: "Password Matched",
                    ),
                    SizedBox(height: 50),
                    state.status == RegisterStatus.loading
                        ? const Center(child: CircularProgressIndicator())
                        : CustomElevatedButton(
                            isSignUpLoginDesign: true,
                            text: "Sign up",
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                if (state.isMatched &&
                                    state.isMiniEightOrSpecialChar &&
                                    state.oneNumber &&
                                    state.lowerUpperChars) {
                                  context
                                      .read<DoctorRegisterCubit>()
                                      .submitRegisterDoctor();
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Please fulfill all password requirements")),
                                  );
                                }
                              }
                            },
                            selectedNumber: 1,
                          ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
