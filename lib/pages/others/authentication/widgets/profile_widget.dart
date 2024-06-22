import 'package:elearning_app_bloc/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar(){
  return AppBar(
    title: Container(
      child: Row(
        children: [
          SizedBox(
            width: 18.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          Text("Profile",
          style: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),),
          SizedBox(
            width: 24.w,
            height: 50.h,
            child: Image.asset("assets/icons/more-vertical.png"),
          )
        ],
      ),
    ),
  );
}