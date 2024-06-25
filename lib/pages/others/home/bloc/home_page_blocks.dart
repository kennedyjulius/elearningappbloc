import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app_bloc/pages/others/home/bloc/home_page_events.dart';
import 'package:elearning_app_bloc/pages/others/home/bloc/home_page_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBlocks extends Bloc<HomePageEvents, HomePageStates> {
  HomePageBlocks():super(const HomePageStates()){
    on<HomePageDots>(_homePageDots);
    on<HomePageCourseItem>(_homePageCourseItem);
  }

  void _homePageDots(HomePageDots event, Emitter<HomePageStates>emit){
    emit(state.copyWith(index: event.index));
  }

  void _homePageCourseItem(HomePageCourseItem event, Emitter<HomePageStates> emit){
    emit(state.copyWith(courseItem: event.courseItem));
  }
}