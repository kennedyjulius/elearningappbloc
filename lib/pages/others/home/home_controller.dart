import 'package:elearning_app_bloc/common/entities/entities.dart';
import 'package:elearning_app_bloc/global.dart';
import 'package:elearning_app_bloc/pages/others/home/bloc/home_page_blocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeController {
  final BuildContext context;
  final UserItem userProfile;

  HomeController({required this.context}) : userProfile = Global.storageService.getUserProfile();

  Future<void> init() async {
    try {
      var result = await CourseAPI.courseList();
      if (result.code == 200) {
        context.read<HomePageBlocks>().add(HomePageCourseItem(result.data!));
      } else {
        print("Error: ${result.code}");
      }
    } catch (e) {
      print("Initialization failed: $e");
    }
  }
}
