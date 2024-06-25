import 'package:elearning_app_bloc/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildsettingsAppBar(){
  return AppBar(
    title: Container(
      child: Text("Settings", style: TextStyle(
        color: AppColors.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 16.sp,
      ),),
    ),
  );
}