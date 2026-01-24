import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduationproject/core/routes/appRoutes.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/core/utils/functions.dart';
import 'package:graduationproject/features/auth/presentation/cubit/patientRegister/patient_register_cubit.dart';
import 'package:graduationproject/features/auth/presentation/cubit/patientRegister/patient_register_state.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomDropDownList.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomElevatedButton.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomTitleTextFormField.dart';
import 'package:graduationproject/features/auth/presentation/widgets/Custom_Back_Translate_Button.dart';
import 'package:graduationproject/features/auth/presentation/widgets/DotsWidgets.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';

class InfoPatientCareGiverTwo extends StatelessWidget {
  InfoPatientCareGiverTwo({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
                    DotsWidget(currentPage: 3, selectedNumber: null),
                    SizedBox(height: 15),
                    CustomWelcomeTextWidget(
                      text: "Just a little bit more",
                      size: 18,
                      fontWeight: FontWeight.w300,
                      color: MyColors.blackColor,
                    ),
                    CustomWelcomeTextWidget(
                      text: "we are almost finished",
                      size: 18,
                      fontWeight: FontWeight.w300,
                      color: MyColors.blackColor,
                    ),
                    SizedBox(height: 35),

                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CustomTitleTextFormField(
                            title: "Your daily role",
                          ),
                        ),
                        SizedBox(height: 10),
                        CustomDropDownList(
                          onChanged: (value) {
                        BlocProvider.of<PatientRegisterStateCubit>(
                          context,
                        ).updateLifestyleInfo(role: value);
                      },
                      selectedValue: state.dailyRole,
                          validator: (value) {
                            return AuthAppFunctions().isEmptyNull(value);
                          },
                          text: "Tell us your daily role",
                          color: MyColors.mainColor,
                          stagesList: [
                            'Working Life',
                            'Student Life',
                            'Parent',
                            'Life After Retirement',
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 20),
                    CustomTitleTextFormField(title: "Your Hobby/ies"),
                    SizedBox(height: 10),
                    CustomDropDownList(
                      onChanged: (value) {
                        BlocProvider.of<PatientRegisterStateCubit>(
                          context,
                        ).updateLifestyleInfo(hobby: value);
                      },
                      selectedValue: state.hobby,
                      stagesList: [
                        'Photography Moments',
                        'Drawing & Art',
                        'Writing & Beauty',
                        'Dance & Movement',
                        'Baking & Treats',
                        'Tech & Gadgets',
                        'Sports & Play',
                      ],
                      validator: (value) {
                        return AuthAppFunctions().isEmptyNull(value);
                      },
                      color: MyColors.mainColor,
                      text: "What you like to do...",
                    ),
                    SizedBox(height: 20),
                    CustomTitleTextFormField(title: "Your interests"),
                    SizedBox(height: 10),
                    CustomDropDownList(
                      onChanged: (value) {
                        BlocProvider.of<PatientRegisterStateCubit>(
                          context,
                        ).updateLifestyleInfo(interest: value);
                      },
                      selectedValue: state.interests,
                      stagesList: [
                        'Fitness',
                        'Walking / Hiking',
                        'Yoga & Stretching',
                        'Cooking',
                        'Healthy Eating',
                        'Travel',
                        'Fashion',
                        'Reading',
                        'Gardening',
                        "Movies & TV",
                        "Art & Crafts",
                      ],
                      validator: (value) {
                        return AuthAppFunctions().isEmptyNull(value);
                      },
                      color: MyColors.mainColor,
                      text: "What you want to do or try...",
                    ),

                    SizedBox(height: 50),
                    CustomElevatedButton(
                      isSignUpLoginDesign: false,
                      text: "Continue",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          (context).push(AppRoutes.setupPatientPassword);
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
