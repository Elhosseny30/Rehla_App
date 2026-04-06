import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduationproject/core/routes/appRoutes.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/core/utils/functions.dart';
import 'package:graduationproject/features/auth/presentation/cubit/care_giver_Register/cubit/care_giver_register_cubit.dart';
import 'package:graduationproject/features/auth/presentation/cubit/patientRegister/patient_register_cubit.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomDropDownList.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomElevatedButton.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomTextField.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomTitleTextFormField.dart';
import 'package:graduationproject/features/auth/presentation/widgets/Custom_Back_Translate_Button.dart';
import 'package:graduationproject/features/auth/presentation/widgets/DotsWidgets.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';

class InfoCareGiverThree extends StatelessWidget {
  InfoCareGiverThree({super.key});
  final TextEditingController age = TextEditingController();
  final TextEditingController timeRange = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CareGiverRegisterCubit,CareGiverRegisterState>(
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
                    DotsWidget(currentPage: 3, selectedNumber: 2),

                    SizedBox(height: 50),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: CustomTitleTextFormField(title: "Age"),
                              ),
                              SizedBox(height: 10),
                              CustomTextField(
                                selectedNumber: 2,
                                validator: (value) {
                                  return AuthAppFunctions().isNum(value);
                                },
                                tappedEnableBorder: true,
                                hintText: '',
                                isPassword: false,
                                controller: age,
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
                                  title: "Your daily role",
                                ),
                              ),
                              SizedBox(height: 10),
                              CustomDropDownList(
                                onChanged: (value) {
                                  BlocProvider.of<CareGiverRegisterCubit>(
                                    context,
                                  ).updateJourneyInfo(roleDay: value);
                                },
                                selectedValue: /*state.dailyRole*/ null,
                                validator: (value) {
                                  return AuthAppFunctions().isEmptyNull(value);
                                },
                                text: "Select",
                                color: MyColors.greenColor,
                                stagesList: [
                                  'Working Life',
                                  'Student Life',
                                  'Parent',
                                  'Life After Retirement',
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomTitleTextFormField(
                        title: "What describes your journey? ",
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomDropDownList(
                      onChanged: (value) {
                        BlocProvider.of<CareGiverRegisterCubit>(
                          context,
                        ).updateJourneyInfo(describeJourney: value);
                      },
                      selectedValue: /*state.dailyRole*/ null,
                      validator: (value) {
                        return AuthAppFunctions().isEmptyNull(value);
                      },
                      text: "Select",
                      color: MyColors.greenColor,
                      stagesList: [
                        'Feeling overwhelmed at times',
                        'Trying my best to stay strong',
                        'Looking for guidance',
                        'Managing stress or anxiety',
                        'Wanting emotional support',
                        'Wanting to connect with other caregivers',
                        'Wanting to learn how to support better',
                      ],
                    ),

                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomTitleTextFormField(
                        title: "How Long have you been a caregiver",
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      selectedNumber: 2,
                      validator: (value) {
                        return AuthAppFunctions().isEmptyNull(value);
                      },
                      tappedEnableBorder: true,
                      hintText: 'time range',
                      isPassword: false,
                      controller: timeRange,
                    ),

                    SizedBox(height: 20),

                    SizedBox(height: 20),
                    CustomElevatedButton(
                      isSignUpLoginDesign: false,
                      text: "Continue",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<CareGiverRegisterCubit>(
                            context,
                          ).updateJourneyInfo(
                            age: age.text,
                            durationOfCareGiver: timeRange.text,
                          );
                          (context).push(AppRoutes.setupCareGiverPassword);
                        }
                      },
                      selectedNumber: 2,
                    ),
                    SizedBox(height: 20),
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
