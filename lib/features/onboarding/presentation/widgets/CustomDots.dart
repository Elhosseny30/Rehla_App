import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/core/constants/colors.dart';
import 'package:graduationproject/features/onboarding/data/repo/onBoardingData.dart';
import 'package:graduationproject/features/onboarding/presentation/cubit/on_boarding_cubit_cubit.dart';
import 'package:graduationproject/features/onboarding/presentation/cubit/on_boarding_cubit_state.dart';

class CustomDots extends StatelessWidget {
  CustomDots({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        int currentPage = 0;
        if (state is OnBoardingDots) {
          currentPage = state.pageNumber;
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              OnBoardingListDat.length,
              (index) => AnimatedContainer(
                duration: Duration(microseconds: 900),
                margin: EdgeInsets.only(right: 10),
                width: (index == currentPage) ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  border: Border.all(color: MyColors.mainColor),
                  color: (index == currentPage)
                      ? MyColors.mainColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
