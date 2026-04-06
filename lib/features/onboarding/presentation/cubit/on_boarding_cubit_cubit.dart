import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/features/onboarding/data/repo/onBoardingData.dart';
import 'package:graduationproject/features/onboarding/presentation/cubit/on_boarding_cubit_state.dart';



class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());
  int currentPageNumber = 0;
  PageController pageController = PageController();
  void getPageViewNumber(int pageNumber) {
    currentPageNumber = pageNumber;
    emit(OnBoardingDots(pageNumber));
  }

  void getContinueButton() {
    if (currentPageNumber < OnBoardingListDat.length - 1) {
      currentPageNumber++;
      pageController.animateToPage(
        currentPageNumber,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      emit(OnBoardingDots(currentPageNumber));
    }
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
