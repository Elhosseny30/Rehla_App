
class SessionsState {
  final bool isDoctorsTab;  

  SessionsState({required this.isDoctorsTab});

  SessionsState copyWith({bool? isDoctorsTab}) {
    return SessionsState(
      isDoctorsTab: isDoctorsTab ?? this.isDoctorsTab,
    );
  }
}