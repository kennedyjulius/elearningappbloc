import 'package:elearning_app_bloc/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icons/person.png"),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget homePageText(String text, {Color color=AppColors.primaryText, int top=20}){
return Container(
  margin: EdgeInsets.only(top: 5.h),
  child: Text(text, style: TextStyle(
    color: AppColors.primaryText,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold
  ),),
);
}
