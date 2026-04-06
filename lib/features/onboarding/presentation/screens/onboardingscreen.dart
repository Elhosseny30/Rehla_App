import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/features/onboarding/presentation/cubit/on_boarding_cubit_cubit.dart';
import 'package:graduationproject/features/onboarding/presentation/widgets/CustomDots.dart';
import 'package:graduationproject/features/onboarding/presentation/widgets/CustomPageViewBuilder.dart';
import 'package:graduationproject/features/onboarding/presentation/widgets/CustomSkipButton.dart';
import 'package:graduationproject/features/onboarding/presentation/widgets/CustomContinueButton.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => OnBoardingCubit(),
        child: Column(
          children: [
            Expanded(flex: 3, 
            child: CustomPageViewBuilder()),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Row(children: [CustomSkipButton(), CustomContinueButton()]),
                  SizedBox(height: 60),
                  CustomDots(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//  Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               flex: 2,
//               child: PageView.builder(
//                 itemCount: OnBoardingListDat.length,
                
//                 itemBuilder: (context, index) {
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(
//                           top: OnBoardingListDat[index].height,
//                         ),
//                         child: Container(
//                           height: 400,
//                           child: Image.asset(
//                             OnBoardingListDat[index].image,
//                             width: double.infinity,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(top: 16, left: 16),
//                         child: Text(
//                           OnBoardingListDat[index].title,
//                           style: TextStyle(
//                             fontSize: 28,
//                             fontFamily: 'Satoshi',
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 8, left: 16),
//                         child: Text(
//                           OnBoardingListDat[index].text,
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontFamily: "Satoshi",
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               child: Container(
//                 height: 50,
//                 width: 100,
//                 child: ElevatedButton(onPressed: () {}, child: Text("Continue"))),
//             ),
//           ],
//         ),
//       ),
//     );