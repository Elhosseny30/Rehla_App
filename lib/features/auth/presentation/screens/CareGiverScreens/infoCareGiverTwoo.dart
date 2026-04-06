import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduationproject/core/routes/appRoutes.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/core/utils/fonts.dart';
import 'package:graduationproject/core/utils/functions.dart';
import 'package:graduationproject/features/auth/presentation/cubit/care_giver_Register/cubit/care_giver_register_cubit.dart';
import 'package:graduationproject/features/auth/presentation/cubit/patientRegister/patient_register_cubit.dart';
import 'package:graduationproject/features/auth/presentation/cubit/patientRegister/patient_register_state.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomDropDownList.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomElevatedButton.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomTextField.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomTitleTextFormField.dart';
import 'package:graduationproject/features/auth/presentation/widgets/Custom_Back_Translate_Button.dart';
import 'package:graduationproject/features/auth/presentation/widgets/DotsWidgets.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';

class InfoCareGiverTwo extends StatelessWidget {
  InfoCareGiverTwo({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nickName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CareGiverRegisterCubit, CareGiverRegisterState>(
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
                    DotsWidget(currentPage: 2, selectedNumber: 2),
                    SizedBox(height: 15),

                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontFamily: fontsApp.mainFont,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: MyColors.blackColor,
                        ),
                        children: [
                          TextSpan(text: "Some info to help"),
                          TextSpan(
                            text: " Rafek \n",
                            style: TextStyle(
                              color: MyColors.greenColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: "be best journey companion possible"),
                        ],
                      ),
                    ),

                    SizedBox(height: 35),

                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CustomTitleTextFormField(
                            title: "Who are you supporting",
                          ),
                        ),
                        SizedBox(height: 10),
                        CustomDropDownList(
                          onChanged: (value) {
                            BlocProvider.of<CareGiverRegisterCubit>(
                              context,
                            ).updateSupportInfo(whoIsSupported: value);
                          },
                          selectedValue: state.whoSupporting,
                          validator: (value) {
                            return AuthAppFunctions().isEmptyNull(value);
                          },
                          text: "Tell us",
                          color: MyColors.greenColor,
                          stagesList: [
                            'Mother',
                            'Wife',
                            'Daughter',
                            'Sister',
                            'GrandMother',
                            'Relative',
                            'Friend',
                            'Prefer not to say',
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 20),
                    CustomTitleTextFormField(title: "Their name or nickname"),
                    SizedBox(height: 10),

                    CustomTextField(
                      selectedNumber: 2,
                      validator: (value) {
                        return AuthAppFunctions().isEmptyNull(value);
                      },
                      tappedEnableBorder: true,
                      hintText: 'nickname',
                      isPassword: false,
                      controller: nickName,
                    ),
                    SizedBox(height: 20),
                    CustomTitleTextFormField(
                      title: "What Would you like support with",
                    ),
                    SizedBox(height: 10),
                    CustomDropDownList(
                      onChanged: (value) {
                        BlocProvider.of<CareGiverRegisterCubit>(
                          context,
                        ).updateSupportInfo(typeOfSupporting: value);
                      },
                      selectedValue: state.supportType,
                      stagesList: [
                        'Understanding',
                        'Treatment',
                        'Emotional Support',
                        'Nutrition Tips',
                        'Managing Stress',
                        'Communicating With',
                        'Doctors',
                        'Supporting daily life',
                        'Activities',
                      ],
                      validator: (value) {
                        return AuthAppFunctions().isEmptyNull(value);
                      },
                      color: MyColors.greenColor,
                      text: "Select From options",
                    ),

                    SizedBox(height: 50),
                    CustomElevatedButton(
                      isSignUpLoginDesign: false,
                      text: "Continue",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<CareGiverRegisterCubit>(
                            context,
                          ).updateSupportInfo(theirNickName: nickName.text);
                          (context).push(AppRoutes.infoCareGiverThree);
                        }
                      },
                      selectedNumber: 2,
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
