import 'package:elearning_app_bloc/pages/others/home/homescreen.dart';
import 'package:elearning_app_bloc/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildPage(int index){
  List<Widget> _widget = [
    const Homescreen(),
    Center(child: Text("Course"),),
    Center(child: Text("Chat"),),
    Center(child: Text("Profile"),),
    Center(child: Text("Search"),),
  ];

  return _widget[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
                      label: "Home",
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset("assets/icons/home.png"),
                      ),
                      activeIcon: SizedBox(
                        height: 15.w,
                        width: 15.w,
                        child: Image.asset(
                          "assets/icons/home.png",
                          color: AppColors.primaryElement,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "Search",
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset("assets/icons/search.png"),
                      ),
                      activeIcon: SizedBox(
                        height: 15.w,
                        width: 15.w,
                        child: Image.asset(
                          "assets/icons/search.png",
                          color: AppColors.primaryElement,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "Course",
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset("assets/icons/play-circle.png"),
                      ),
                      activeIcon: SizedBox(
                        height: 15.w,
                        width: 15.w,
                        child: Image.asset(
                          "assets/icons/play-circle.png",
                          color: AppColors.primaryElement,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "Chat",
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset("assets/icons/message-circle.png"),
                      ),
                      activeIcon: SizedBox(
                        height: 15.w,
                        width: 15.w,
                        child: Image.asset(
                          "assets/icons/message-circle.png",
                          color: AppColors.primaryElement,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "Profile",
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset("assets/icons/person2.png"),
                      ),
                      activeIcon: SizedBox(
                        height: 15.w,
                        width: 15.w,
                        child: Image.asset(
                          "assets/icons/person2.png",
                          color: AppColors.primaryElement,
                        ),
                      ),
                    ),
];