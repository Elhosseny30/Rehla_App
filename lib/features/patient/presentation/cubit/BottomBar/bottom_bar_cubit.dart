import 'package:bloc/bloc.dart';

import 'package:graduationproject/features/patient/presentation/cubit/BottomBar/bottom_bar_state.dart';

class BottomBarCubit extends Cubit<BottomBarState> {
  BottomBarCubit() : super(BottomBarState(currentIndex: 0));
  void setIndex(int index) {
    emit(state.copyWith(newIndex: index));
  }
}
