class HomePageStates {
  const HomePageStates({
    this.index = 0
  });
  final int index ;
  HomePageStates copyWith({required index}){
    return HomePageStates(
      index: index??this.index
    );
  }
}