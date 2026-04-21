class BottomBarState {
  final int currentIndex;
  BottomBarState({this.currentIndex = 0});

  BottomBarState copyWith({int ? newIndex}) {
    return BottomBarState(
      currentIndex: newIndex ?? currentIndex,
    );
  }
}
