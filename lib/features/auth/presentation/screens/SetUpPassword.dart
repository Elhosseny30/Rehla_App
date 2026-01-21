import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduationproject/core/Routes/appRoutes.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/core/utils/functions.dart';
import 'package:graduationproject/features/auth/presentation/cubit/patientRegister/patient_register_cubit.dart';
import 'package:graduationproject/features/auth/presentation/cubit/patientRegister/patient_register_state.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomElevatedButton.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomPasswordChecksText.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomTextField.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomTitleTextFormField.dart';
import 'package:graduationproject/features/auth/presentation/widgets/Custom_Back_Translate_Button.dart';
import 'package:graduationproject/features/auth/presentation/widgets/DotsWidgets.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';
import 'package:graduationproject/core/routes/appRoutes.dart' hide AppRoutes;

class SetupPassword extends StatelessWidget {
  SetupPassword({super.key});
  final TextEditingController setPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientRegisterStateCubit, PatientRegisterState>(
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
                                selectedNumber: null,
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
                              color: MyColors.mainColor,

                              text: "New Account",
                              size: 20,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: CustomBackTranslateButton(
                              selectedNumber: null,
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
                    DotsWidget(currentPage: 4, selectedNumber: null),
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
                      selectedNumber: null,
                      onChanged: (value) {
                        BlocProvider.of<PatientRegisterStateCubit>(
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
                      selectedNumber: null,
                      onChanged: (value) {
                        BlocProvider.of<PatientRegisterStateCubit>(
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
                      text:"a 8 or more characters Contains a special character (@#\$%&.^*/_-)",
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
                    CustomElevatedButton(
                      isSignUpLoginDesign: true,
                      text: "Sign up",
                      onPressed: () {
                        if(formKey.currentState!.validate()){
                          if(state.isMatched && state.isMiniEightOrSpecialChar && state.oneNumber && state.lowerUpperChars){
                            context.go(
                              AppRoutes.hekkoo,
                              extra: state.firstName,);
                          }
                        }
                      },
                      selectedNumber: null,
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
