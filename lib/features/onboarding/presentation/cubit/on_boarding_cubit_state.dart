

import 'package:flutter/material.dart';

@immutable
sealed class OnBoardingState {}

final class OnBoardingInitial extends OnBoardingState {}

final class OnBoardingDots extends OnBoardingState {
  final int pageNumber;
  OnBoardingDots(this.pageNumber); 
}
