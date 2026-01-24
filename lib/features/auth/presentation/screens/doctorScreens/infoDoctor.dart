import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduationproject/core/routes/appRoutes.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/core/utils/functions.dart';
import 'package:graduationproject/features/auth/presentation/cubit/doctorRegister/doctor_register_cubit.dart';
import 'package:graduationproject/features/auth/presentation/cubit/doctorRegister/doctor_register_state.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomDropDownList.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomElevatedButton.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomTextField.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomTitleTextFormField.dart';
import 'package:graduationproject/features/auth/presentation/widgets/Custom_Back_Translate_Button.dart';
import 'package:graduationproject/features/auth/presentation/widgets/DotsWidgets.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';

class InfoDoctor extends StatelessWidget {
  InfoDoctor({super.key});
  final TextEditingController clinicName = TextEditingController();
  final TextEditingController clinicAddress = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorRegisterCubit, DoctorRegisterState>(
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
                    DotsWidget(currentPage: 2, selectedNumber: 1),
                    SizedBox(height: 15),
                    CustomWelcomeTextWidget(
                      text: "some needed info to help",
                      size: 18,
                      fontWeight: FontWeight.w300,
                      color: MyColors.blackColor,
                    ),

                    CustomWelcomeTextWidget(
                      text: "get you verified",
                      size: 18,
                      fontWeight: FontWeight.w300,
                      color: MyColors.blackColor,
                    ),

                    SizedBox(height: 35),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomTitleTextFormField(title: "City/region"),
                    ),
                    SizedBox(height: 10),
                    CustomDropDownList(
                      stagesList: [
                        'Mansoura',
                        'Cairo',
                        'Alex',
                        'Tanta',
                        'Elmahla EL-Kubra',
                      ],
                      validator: (value) {
                        return AuthAppFunctions().isEmptyNull(value);
                      },
                      color: MyColors.blueColor,
                      text: 'Tell us your where you are from',
                      selectedValue: state.city,
                      onChanged: (value) {
                        BlocProvider.of<DoctorRegisterCubit>(
                          context,
                        ).updateClinicInfo(city: value);
                      },
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomTitleTextFormField(
                        title: "Medical speciality",
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomDropDownList(
                      stagesList: [
                        'Oncologist',
                        'Gynecologist',
                        'Therapist',
                        'Nutritionist',
                        'Other',
                      ],
                      validator: (value) {
                        return AuthAppFunctions().isEmptyNull(value);
                      },
                      color: MyColors.blueColor,
                      text: 'Your speciality',
                      selectedValue: state.medicalSpecialty,
                      onChanged: (value) {
                        BlocProvider.of<DoctorRegisterCubit>(
                          context,
                        ).updateClinicInfo(
                          specialty:value,
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          CustomTitleTextFormField(title: "Clinic name "),
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
                      hintText: "Write it's name",
                      isPassword: false,
                      controller: clinicName,
                      validator: (value) {
                        return null;
                      },
                      tappedEnableBorder: true,
                      selectedNumber: 1,
                    ),

                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          CustomTitleTextFormField(title: "Clinic address "),
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
                      hintText: "Write it's address",
                      isPassword: false,
                      controller: clinicAddress,
                      validator: (value) {
                        return null;
                      },
                      tappedEnableBorder: true,
                      selectedNumber: 1,
                    ),

                    SizedBox(height: 50),
                    CustomElevatedButton(
                      isSignUpLoginDesign: false,
                      text: "Continue",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<DoctorRegisterCubit>(
                            context,
                          ).updateClinicInfo(
                            clinicName: clinicName.text,
                            clinicAddress: clinicAddress.text,
                          );
                          (context).push(AppRoutes.infoDoctorNationalID);
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
