import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/features/patient/presentation/cubit/session_Screen/cubit/session_screen_state.dart';

class SessionsCubit extends Cubit<SessionsState> {
  SessionsCubit() : super(SessionsState(isDoctorsTab: true));

  void changeTab(bool isDoctors) {
    emit(state.copyWith(isDoctorsTab: isDoctors));
  }
}