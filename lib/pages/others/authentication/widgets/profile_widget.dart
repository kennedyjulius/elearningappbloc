import 'package:elearning_app_bloc/routes/names.dart';
import 'package:elearning_app_bloc/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildProfileAppBar() {
  return AppBar(
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 18.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          Text(
            "Profile",
            style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(
            width: 24.w,
            height: 50.h,
            child: Image.asset("assets/icons/more-vertical.png"),
          ),
        ],
      ),
    ),
  );
}

Widget profileIconAndEditButton() {
  return Container(
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(right: 6.w),
    width: 80.w,
    height: 80.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.w),
      image: DecorationImage(image: AssetImage("assets/icons/headpic.png")),
    ),
    child: Image(
      width: 25.w,
      height: 25.h,
      image: AssetImage("assets/icons/edit_3.png"),
    ),
  );
}

var imagesInfo = <String, String>{
  "Settings": "settings.png",
  "Payment details": "credit-card.png",
  "Achievement": "award.png",
  "Love": "heart(1).png",
  "Reminders": "cube.png",
};

Widget buildListView(BuildContext context) {
  return Column(
    children: imagesInfo.entries.map((entry) {
      return GestureDetector(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                padding: EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  color: AppColors.primaryElement,
                ),
                child: Image.asset("assets/icons/${entry.value}"),
              ),
              SizedBox(width: 15.w),
              Text(
                entry.key,
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          // Handle tap event
          Navigator.of(context).pushNamed(AppRoutes.SETTINGS);
        },
      );
    }).toList(),
  );
}
