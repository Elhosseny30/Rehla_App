import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduationproject/core/routes/appRoutes.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/auth/presentation/cubit/patientRegister/patient_register_cubit.dart';
import 'package:graduationproject/features/auth/presentation/cubit/patientRegister/patient_register_state.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomElevatedButton.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomInkWellSignUp.dart';
import 'package:graduationproject/features/auth/presentation/widgets/Custom_Back_Translate_Button.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';
import 'package:pinput/pinput.dart';

class VerificationEmailPatient extends StatelessWidget {
  VerificationEmailPatient({super.key});
  final TextEditingController pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientRegisterStateCubit, PatientRegisterState>(
      listener: (context, state) {
        if (state.status == RegisterStatus.verifySuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Email verified successfully!"),
              backgroundColor: Colors.green,
            ),
          );

          (context).pushReplacement(AppRoutes.login);
        }
        if (state.status == RegisterStatus.resendSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Code resent successfully! Check your inbox."),
              backgroundColor: Colors.green,
            ),
          );
        }

        if (state.status == RegisterStatus.failure &&
            state.errorMessage != null) {
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
                              selectedNumber: 0,
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
                          alignment: Alignment.centerRight,
                          child: CustomBackTranslateButton(
                            selectedNumber: 0,
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
                  SizedBox(height: 40),
                  CustomWelcomeTextWidget(
                    text: "Check your mail",
                    size: 30,
                    fontWeight: FontWeight.w500,
                    color: MyColors.mainColor,
                  ),

                  SizedBox(height: 25),
                  CustomWelcomeTextWidget(
                    text: "We sent a code to your email",
                    size: 25,
                    fontWeight: FontWeight.w100,
                    color: MyColors.blackColor,
                  ),
                  SizedBox(height: 15),
                  CustomWelcomeTextWidget(
                    text: "Enter 6 digit code we sent to your email",
                    size: 20,
                    fontWeight: FontWeight.w500,
                    color: MyColors.blackColor,
                  ),

                  SizedBox(height: 50),

                  Pinput(
                    controller: pinController,
                    defaultPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: TextStyle(
                        fontSize: 30,
                        color: MyColors.blackColor,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: MyColors.greyRegisterColorContainer,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    focusedPinTheme: PinTheme(
                      width: 70,
                      height: 70,
                      textStyle: TextStyle(
                        fontSize: 30,
                        color: MyColors.blackColor,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: MyColors.mainColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    length: 6,
                    autofocus: true,
                  ),

                  SizedBox(height: 60),

                  state.status == RegisterStatus.loading
                      ? Center(child: CircularProgressIndicator())
                      : CustomElevatedButton(
                          text: "Verify code",
                          onPressed: () {
                            if (pinController.text.length == 6) {
                              BlocProvider.of<PatientRegisterStateCubit>(
                                context,
                              ).verifayEmail(
                                email: state.email ?? "",
                                code: pinController.text,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Please enter the full 6-digit code",
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          selectedNumber: 0,
                          isSignUpLoginDesign: false,
                        ),

                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomWelcomeTextWidget(
                        text: "Haven't got the email? ",
                        size: 18,
                        fontWeight: FontWeight.w400,
                        color: MyColors.blackColor,
                      ),
                      CustomInkWellSignUp(
                        selectedNumber: 0,
                        text: "Resend code",
                        onTap: () {
                          BlocProvider.of<PatientRegisterStateCubit>(
                            context,
                          ).resendVerificationEmail(email: state.email ?? "");
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
