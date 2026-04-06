import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduationproject/core/Routes/appRoutes.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/core/utils/functions.dart';
import 'package:graduationproject/features/auth/presentation/cubit/patientRegister/patient_register_cubit.dart';
import 'package:graduationproject/features/auth/presentation/cubit/patientRegister/patient_register_state.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomDropDownList.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomElevatedButton.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomTextField.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomTitleTextFormField.dart';
import 'package:graduationproject/features/auth/presentation/widgets/Custom_Back_Translate_Button.dart';
import 'package:graduationproject/features/auth/presentation/widgets/DotsWidgets.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';

class InfoPatientCareGiverScreen extends StatelessWidget {
  InfoPatientCareGiverScreen({super.key});
  final TextEditingController dateOfBirth = TextEditingController();
  final TextEditingController height = TextEditingController();
  final TextEditingController weight = TextEditingController();
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
                    DotsWidget(currentPage: 2, selectedNumber: null),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomWelcomeTextWidget(
                          text: "some info to help",
                          size: 18,
                          fontWeight: FontWeight.w300,
                          color: MyColors.blackColor,
                        ),
                        CustomWelcomeTextWidget(
                          text: " Rafek",
                          size: 18,
                          fontWeight: FontWeight.w300,
                          color: MyColors.mainColor,
                        ),
                      ],
                    ),
                    CustomWelcomeTextWidget(
                      text: "be the best journey companion",
                      size: 18,
                      fontWeight: FontWeight.w300,
                      color: MyColors.blackColor,
                    ),
                    SizedBox(height: 35),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: CustomTitleTextFormField(
                                  title: "Date of birth",
                                ),
                              ),
                              SizedBox(height: 10),
                              CustomTextField(
                                selectedNumber: null,
                                validator: (value) {
                                  return AuthAppFunctions().isEmptyNull(value);
                                },
                                tappedEnableBorder: true,
                                hintText: 'DD/MM/YYYY',
                                isPassword: false,
                                controller: dateOfBirth,
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
                                child: CustomTitleTextFormField(
                                  title: "Height",
                                ),
                              ),
                              SizedBox(height: 10),
                              CustomTextField(
                                selectedNumber: null,
                                tappedEnableBorder: true,
                                hintText: '---cm',
                                isPassword: false,
                                controller: height,
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
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: CustomTitleTextFormField(
                                  title: "Illness Stage",
                                ),
                              ),
                              SizedBox(height: 10),
                              CustomDropDownList(
                                onChanged: (value) {
                                  BlocProvider.of<PatientRegisterStateCubit>(
                                    context,
                                  ).updateMedicalInfo(illnessStage: value);
                                },
                                selectedValue: state.illnessStage,
                                validator: (value) {
                                  return AuthAppFunctions().isEmptyNull(value);
                                },
                                text: "Choose a stage",
                                color: MyColors.mainColor,
                                stagesList: [
                                  'Stage O',
                                  'Stage I',
                                  'Stage II',
                                  'Stage III',
                                  'Stage IV',
                                  "I'm not sure",
                                  "I prefer to skip",
                                ],
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
                                child: CustomTitleTextFormField(
                                  title: "Weight",
                                ),
                              ),
                              SizedBox(height: 10),
                              CustomTextField(
                                hintText: "---kg",
                                isPassword: false,
                                controller: weight,
                                validator: (value) {
                                  return AuthAppFunctions().isEmptyNull(value);
                                },
                                tappedEnableBorder: true,
                                selectedNumber: null,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    CustomTitleTextFormField(title: "Where your journey at"),
                    SizedBox(height: 10),
                    CustomDropDownList(
                      onChanged: (value) {
                        BlocProvider.of<PatientRegisterStateCubit>(
                          context,
                        ).updateMedicalInfo(journeyStage: value);
                      },
                      selectedValue: state.journeyStage,
                      stagesList: [
                        'I am currently undergoing treatment',
                        'I am a survivor (post-treatment)',
                        'I am monitoring symptoms',
                        'I am newly diagnosed',
                        'Prefer not to say (can skip)',
                      ],
                      validator: (value) {
                        return AuthAppFunctions().isEmptyNull(value);
                      },
                      color: MyColors.mainColor,
                      text: "Choose where you at",
                    ),
                    SizedBox(height: 20),
                    CustomTitleTextFormField(title: "Current concerns"),
                    SizedBox(height: 10),
                    CustomDropDownList(
                      onChanged: (value) {
                        BlocProvider.of<PatientRegisterStateCubit>(
                          context,
                        ).updateMedicalInfo(concern: value);
                      },
                      selectedValue: state.currentConcern,
                      stagesList: [
                        'Managing side effects',
                        'Treatment reminders',
                        'Nutrition & diet',
                        'Mental health & support',
                        'Physical activity plan',
                        'Community connection',
                        'Monitoring recurrence risk',
                        'Tracking symptoms',
                        'Everything',
                        "I'll explore first",
                      ],
                      validator: (value) {
                        return AuthAppFunctions().isEmptyNull(value);
                      },
                      color: MyColors.mainColor,
                      text: "Tell us your concerns",
                    ),

                    SizedBox(height: 50),
                    CustomElevatedButton(
                      isSignUpLoginDesign: false,
                      text: "Continue",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<PatientRegisterStateCubit>(
                            context,
                          ).updateMedicalInfo(
                            dob: dateOfBirth.text,
                            height: height.text,
                            weight: weight.text,
                          );

                          (context).push(AppRoutes.infoPatientCareGiverTwo);
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
