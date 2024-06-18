import 'package:elearning_app_bloc/pages/others/authentication/bloc/home_bloc.dart';
import 'package:elearning_app_bloc/pages/others/authentication/bloc/home_event.dart';
import 'package:elearning_app_bloc/pages/others/authentication/widgets/application_widget.dart';
import 'package:elearning_app_bloc/pages/others/authentication/widgets/custom_appbar.dart';
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
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           homePageText("hello", color: AppColors.primaryThreeElementText),
           homePageText("kennedy"),
           SizedBox(height: 20.h,),
           searchView(),

            BlocBuilder<AppBlocs, AppState>(
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
                          items: bottomTabs,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
