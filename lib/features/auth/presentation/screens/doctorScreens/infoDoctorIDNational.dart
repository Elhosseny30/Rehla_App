// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:graduationproject/core/utils/colors.dart';
// import 'package:graduationproject/core/utils/file.dart';
// import 'package:graduationproject/core/utils/fonts.dart';
// import 'package:graduationproject/features/auth/presentation/widgets/CustomTitleTextFormField.dart';
// import 'package:graduationproject/features/auth/presentation/widgets/Custom_Back_Translate_Button.dart';
// import 'package:graduationproject/features/auth/presentation/widgets/DotsWidgets.dart';
// import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';
// import 'package:image_picker/image_picker.dart';

// class InfoDoctorNationalID extends StatefulWidget {
//   InfoDoctorNationalID({super.key});

//   @override
//   State<InfoDoctorNationalID> createState() => _InfoDoctorNationalIDState();
// }

// class _InfoDoctorNationalIDState extends State<InfoDoctorNationalID> {
//   final TextEditingController cameraIcon = TextEditingController();

//   final TextEditingController nationalIdNumberController = TextEditingController();

//   GlobalKey<FormState> formKey = GlobalKey();

//   bool isScanning = false; // عشان نعرض لودينج وقت المعالجة

//   // دالة فتح الكاميرا والمعالجة
//   Future<void> _takePictureAndScan() async {
//     final ImagePicker picker = ImagePicker();

//     // 1. فتح الكاميرا
//     final XFile? photo = await picker.pickImage(source: ImageSource.camera);

//     if (photo != null) {
//       setState(() {
//         isScanning = true; // بدأ التحميل
//         cameraIcon.text = "Image Captured ✅"; // تغيير النص
//       });

//       // 2. إرسال الصورة للـ AI Model لاستخراج الرقم
//       File imageFile = File(photo.path);
//       String? extractedID = await IDScannerService.extractID(imageFile);

//       setState(() {
//         isScanning = false; // انتهى التحميل
//       });

//       if (extractedID != null) {
//         // 3. لو لقينا الرقم، نكتبه في الفيلد أوتوماتيك
//         nationalIdNumberController.text = extractedID;
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("تم استخراج الرقم القومي بنجاح!"), backgroundColor: Colors.green),
//         );
//       } else {
//         // لو فشل، اطلب منه يدخله يدوي
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("لم يتم التعرف على الرقم، يرجى إدخاله يدوياً"), backgroundColor: Colors.orange),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0),
//         child: Form(
//           key: formKey,
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
//                           selectedNumber: 1,
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
//                         color: MyColors.blueColor,

//                         text: "New Account",
//                         size: 20,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Align(
//                       alignment: Alignment.centerRight,
//                       child: CustomBackTranslateButton(
//                         selectedNumber: 1,
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
//               DotsWidget(currentPage: 3, selectedNumber: 1),
//               SizedBox(height: 15),
//               CustomWelcomeTextWidget(
//                 text: "some needed info to help",
//                 size: 18,
//                 fontWeight: FontWeight.w300,
//                 color: MyColors.blackColor,
//               ),

//               CustomWelcomeTextWidget(
//                 text: "get you verified",
//                 size: 18,
//                 fontWeight: FontWeight.w300,
//                 color: MyColors.blackColor,
//               ),

//               SizedBox(height: 35),

//               CustomTitleTextFormField(title: "National ID picture"),
//               SizedBox(height: 10),
//               const CustomTitleTextFormField(title: "National ID picture"),
//               const SizedBox(height: 10),
//               TextFormField(
//                 controller: cameraIcon,
//                 readOnly: true, // عشان محدش يكتب فيه، يدوس بس
//                 onTap: _takePictureAndScan, // لما يدوس على الفيلد نفسه يفتح الكاميرا
//                 decoration: InputDecoration(
//                   // عرض لودينج مكان الأيقونة لو بيحمل
//                   suffixIcon: isScanning
//                       ? const Padding(padding: EdgeInsets.all(12), child: CircularProgressIndicator(strokeWidth: 2))
//                       : IconButton(
//                           onPressed: _takePictureAndScan,
//                           icon: const Icon(Icons.camera_alt_outlined),
//                         ),
//                   filled: true,
//                   fillColor: MyColors.babyGreyColor,
//                   hintText: "Upload a picture",
//                   hintStyle: TextStyle(
//                     fontFamily: fontsApp.mainFont, // تأكد إن fontsApp مستدعى صح
//                     fontWeight: FontWeight.w500,
//                     fontSize: 20,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(16),
//                     borderSide: BorderSide.none,
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(16),
//                     borderSide: const BorderSide(width: 1, color: MyColors.blueColor),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 30),

//               // 2. حقل الرقم القومي (هيتم تعبئته تلقائياً)
//               const CustomTitleTextFormField(title: "National ID Number"),
//               const SizedBox(height: 10),
//               TextFormField(
//                 controller: nationalIdNumberController, // الكنترولر اللي هيستقبل الرقم
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: MyColors.babyGreyColor,
//                   hintText: "14 Digits will appear here",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(16),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

/* ******************  */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduationproject/core/Routes/appRoutes.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/core/utils/functions.dart';
import 'package:graduationproject/features/auth/presentation/cubit/doctorRegister/doctor_register_cubit.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomElevatedButton.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomTextField.dart';
import 'package:graduationproject/features/auth/presentation/widgets/CustomTitleTextFormField.dart';
import 'package:graduationproject/features/auth/presentation/widgets/Custom_Back_Translate_Button.dart';
import 'package:graduationproject/features/auth/presentation/widgets/DotsWidgets.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';

class InfoDoctorNationalID extends StatelessWidget {
  InfoDoctorNationalID({super.key});
  TextEditingController cameraController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
                DotsWidget(currentPage: 3, selectedNumber: 1),
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
                CustomTitleTextFormField(title: "National ID Number"),
                SizedBox(height: 10),
                CustomTextField(
                  nationalID: true,
                  hintText: "Enter National ID Number",
                  isPassword: false,
                  controller: cameraController,
                  validator: (value) {
                    return AuthAppFunctions().validateNationalID(value);
                  },
                  tappedEnableBorder: false,
                  selectedNumber: 1,
                ),
                SizedBox(height: 90),
                CustomElevatedButton(
                  text: "Continue",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<DoctorRegisterCubit>(
                        context,
                      ).updateNationalID(id: cameraController.text);
                      context.push(AppRoutes.setupDoctorPassword);
                    }
                  },
                  selectedNumber: 1,
                  isSignUpLoginDesign: false,
                ),

                SizedBox(height: 90),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
