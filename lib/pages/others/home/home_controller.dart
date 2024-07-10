import 'package:elearning_app_bloc/common/entities/user.dart';
import 'package:elearning_app_bloc/global.dart';
import 'package:flutter/material.dart';

class HomeController {
  final BuildContext context;
  UserItem userProfile = Global.storageService.getUserProfile();
  HomeController({
    required this.context
  });
  void init(){
    print("...home controller init method");
  }
}