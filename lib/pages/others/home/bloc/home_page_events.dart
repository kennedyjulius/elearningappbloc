import 'package:elearning_app_bloc/pages/others/home/bloc/home_page_states.dart';

abstract class HomePageEvents {
  const HomePageEvents();
}

class HomePageDots extends HomePageEvents {
  final int index;
  const HomePageDots(this.index);
}
