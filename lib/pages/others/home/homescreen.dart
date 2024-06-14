import 'package:elearning_app_bloc/pages/others/authentication/bloc/home_bloc.dart';
import 'package:elearning_app_bloc/pages/others/authentication/bloc/home_event.dart';
import 'package:elearning_app_bloc/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlocs, AppState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              body: buildPage(_index),
              bottomNavigationBar: Container(
                width: 375.w,
                height: 58.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.h),
                    topRight: Radius.circular(20.h),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                    )
                  ],
                ),
                child: BottomNavigationBar(
                  elevation: 0,
                  currentIndex: _index,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedItemColor: AppColors.primaryElement,
                  unselectedItemColor: AppColors.primaryFourElementText,
                  onTap: (value) {
                    // Dispatch event to change state
                    context.read<AppBlocs>().add(TriggerAppEvent(value));
                    setState(() {
                      _index = value;
                    });
                  },
                  items: [
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
