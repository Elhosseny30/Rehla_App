// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:graduationproject/core/routes/appRoutes.dart';
// import 'package:graduationproject/core/utils/colors.dart';
// import 'package:graduationproject/core/utils/registerStrings.dart';
// import 'package:graduationproject/features/auth/presentation/widgets/CustomConatinerWidget.dart';
// import 'package:graduationproject/features/auth/presentation/widgets/CustomElevatedButton.dart';
// import 'package:graduationproject/features/auth/presentation/widgets/CustomInkWellSignUp.dart';
// import 'package:graduationproject/features/auth/presentation/widgets/Custom_Back_Translate_Button.dart';
// import 'package:graduationproject/features/auth/presentation/widgets/DotsWidgets.dart';
// import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   int? selectedIndex;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24),
//           child: ListView(
//             children: [
//               Row(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Expanded(
//                     child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: GestureDetector(
//                         onTap: () {},
//                         child: CustomBackTranslateButton(
//                           selectedNumber: selectedIndex,
//                           iconSize: 25,
//                           width: 80,
//                           height: 50,
//                           icon: Icons.arrow_back_ios_new,
//                           onTap: () {
//                             context.pop();
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: CustomWelcomeTextWidget(
//                         fontWeight: FontWeight.w500,
//                         color: selectedIndex == 1
//                             ? MyColors.blueColor
//                             : MyColors.mainColor,
//                         text: "New Account",
//                         size: 20,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Align(
//                       alignment: Alignment.centerRight,
//                       child: CustomBackTranslateButton(
//                         selectedNumber: selectedIndex,
//                         iconSize: 25,
//                         width: 80,
//                         height: 50,
//                         icon: Icons.translate,
//                         // TODO
//                         onTap: () {},
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 30),
//               DotsWidget(currentPage: 0, selectedNumber: selectedIndex),
//               SizedBox(height: 100),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: FractionallySizedBox(
//                         widthFactor: 1,
//                         child: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               selectedIndex = 0;
//                             });
//                           },
//                           child: CustomContainerWidget(
//                             eachIcon: 0,
//                             selectedNumber: selectedIndex,
//                             isSelected: selectedIndex == 0,
//                             title: RegisterStrings.onYourJourney,
//                             textOne: RegisterStrings.guidanceAndSupport,
//                             textTwo: RegisterStrings.throughYourJourney,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   Expanded(
//                     child: Align(
//                       alignment: Alignment.centerRight,
//                       child: FractionallySizedBox(
//                         widthFactor: 1,
//                         child: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               selectedIndex = 1;
//                             });
//                           },
//                           child: CustomContainerWidget(
//                             eachIcon: 1,
//                             selectedNumber: selectedIndex,
//                             isSelected: selectedIndex == 1,
//                             title: RegisterStrings.medicalGuide,
//                             textOne: RegisterStrings.aVerifiedDoctor,
//                             textTwo: RegisterStrings.providingTrustedHelp,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 30),
//               Align(
//                 alignment: Alignment.center,
//                 child: FractionallySizedBox(
//                   widthFactor: 0.5,
//                   child: GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedIndex = 2;
//                       });
//                     },
//                     child: CustomContainerWidget(
//                       eachIcon: 2,
//                       selectedNumber: selectedIndex,
//                       isSelected: selectedIndex == 2,
//                       title: RegisterStrings.careGiver,
//                       textOne: RegisterStrings.helpingALovedOne,
//                       textTwo: RegisterStrings.throughTheirJourney,
//                     ),
//                   ),
//                 ),
//               ),

//               SizedBox(height: 50),
//               if (selectedIndex != null) ...[
//                 CustomElevatedButton(
//                   isSignUpLoginDesign: false,
//                   selectedNumber: selectedIndex,
//                   text: "Continue",
//                   onPressed: () {
//                     if (selectedIndex == 0 || selectedIndex == 2) {
//                       (context).push(AppRoutes.patientCareGiverScreen);
//                     } else {
//                       (context).push(AppRoutes.doctorScreen);
//                     }
//                   },
//                 ),
//               ],
//               SizedBox(height: 50),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CustomWelcomeTextWidget(
//                     text: "Have an account? ",
//                     size: 15,
//                     fontWeight: FontWeight.w400,
//                     color: MyColors.blackColor,
//                   ),
//                   CustomInkWellSignUp(
//                     selectedNumber: selectedIndex,
//                     text: "Log in",
//                     onTap: () {
//                       context.pop();
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

/* */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduationproject/core/routes/appRoutes.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/core/utils/registerStrings.dart';
import 'package:graduationproject/features/auth/presentation/cubit/patientRegister/patient_register_cubit.dart';
import 'package:graduationproject/features/auth/presentation/cubit/patientRegister/patient_register_state.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomConatinerWidget.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomElevatedButton.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomInkWellSignUp.dart';
import 'package:graduationproject/features/auth/presentation/widgets/Custom_Back_Translate_Button.dart';
import 'package:graduationproject/features/auth/presentation/widgets/DotsWidgets.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientRegisterStateCubit, PatientRegisterState>(
      builder: (context, state) {
        int? selectedIndex = state.userRole;
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
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
                              selectedNumber: selectedIndex,
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
                            color: selectedIndex == 1
                                ? MyColors.blueColor
                                : selectedIndex == 2
                                ? MyColors.greenColor
                                : MyColors.mainColor,
                            text: "New Account",
                            size: 20,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: CustomBackTranslateButton(
                            selectedNumber: selectedIndex,
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
                  DotsWidget(currentPage: 0, selectedNumber: selectedIndex),
                  SizedBox(height: 100),
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: FractionallySizedBox(
                            widthFactor: 1,
                            child: GestureDetector(
                              onTap: () {
                                BlocProvider.of<PatientRegisterStateCubit>(
                                  context,
                                ).selectRole(0);
                              },
                              child: CustomContainerWidget(
                                eachIcon: 0,
                                selectedNumber: selectedIndex,
                                isSelected: selectedIndex == 0,
                                title: RegisterStrings.onYourJourney,
                                textOne: RegisterStrings.guidanceAndSupport,
                                textTwo: RegisterStrings.throughYourJourney,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: FractionallySizedBox(
                            widthFactor: 1,
                            child: GestureDetector(
                              onTap: () {
                                BlocProvider.of<PatientRegisterStateCubit>(
                                  context,
                                ).selectRole(1);
                              },
                              child: CustomContainerWidget(
                                eachIcon: 1,
                                selectedNumber: selectedIndex,
                                isSelected: selectedIndex == 1,
                                title: RegisterStrings.medicalGuide,
                                textOne: RegisterStrings.aVerifiedDoctor,
                                textTwo: RegisterStrings.providingTrustedHelp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.center,
                    child: FractionallySizedBox(
                      widthFactor: 0.5,
                      child: GestureDetector(
                        onTap: () {
                          BlocProvider.of<PatientRegisterStateCubit>(
                            context,
                          ).selectRole(2);
                        },
                        child: CustomContainerWidget(
                          eachIcon: 2,
                          selectedNumber: selectedIndex,
                          isSelected: selectedIndex == 2,
                          title: RegisterStrings.careGiver,
                          textOne: RegisterStrings.helpingALovedOne,
                          textTwo: RegisterStrings.throughTheirJourney,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 50),
                  if (selectedIndex != null) ...[
                    CustomElevatedButton(
                      isSignUpLoginDesign: false,
                      selectedNumber: selectedIndex,
                      text: "Continue",
                      onPressed: () {
                        if (selectedIndex == 0) {
                          (context).push(AppRoutes.patientCareGiverScreen);
                        } else if(selectedIndex == 2){
                          (context).push(AppRoutes.CareGiverScreen);
                        }
                        else {
                          (context).push(AppRoutes.doctorScreen);
                        }
                      },
                    ),
                  ],
                  SizedBox(height: 50),
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
                        selectedNumber: selectedIndex,
                        text: "Log in",
                        onTap: () {
                          context.pop();
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
