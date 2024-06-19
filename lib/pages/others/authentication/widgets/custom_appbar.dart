import 'package:dots_indicator/dots_indicator.dart';
import 'package:elearning_app_bloc/pages/others/home/bloc/home_page_blocks.dart';

import 'package:elearning_app_bloc/pages/others/home/bloc/home_page_events.dart';
import 'package:elearning_app_bloc/pages/others/home/bloc/home_page_states.dart';
import 'package:elearning_app_bloc/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextEditingController _searchController = TextEditingController();

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

Widget buildHomePageTitle(String text, {Color color = AppColors.primaryText, double top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: 5.h),
    child: Text(
      text,
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget buildSearchView() {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.h),
          border: Border.all(
            color: AppColors.primaryFourElementText,
          ),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              width: 16.w,
              height: 16.w,
              child: Image.asset("assets/icons/search.png"),
            ),
            Container(
              width: 240.w,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                style: TextStyle(
                  fontFamily: "Avenir",
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
                autocorrect: false,
                obscureText: false,
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search your course",
                  contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(13.w)),
            border: Border.all(
              color: AppColors.primaryElement,
            ),
          ),
          child: Image.asset("assets/icons/options.png"),
        ),
      ),
    ],
  );
}

Widget buildSlidersView(BuildContext context, HomePageStates state) {
  return Column(
    children: [
      Container(
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            context.read<HomePageBlocks>().add(HomePageDots(value));
          },
          children: [
            buildSliderContainer(path: "assets/icons/art.png"),
            buildSliderContainer(path: "assets/icons/image_1.png"),
            buildSliderContainer(path: "assets/icons/image_2.png"),
          ],
        ),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator: DotsDecorator(
            color: AppColors.primaryThreeElementText,
            activeColor: AppColors.primaryElement,
            size: Size.square(5.0),
            activeSize: Size(17.0, 5.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget buildSliderContainer({String path = "assets/icons/art.png"}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20.h)),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(path),
      ),
    ),
  );
}

Widget buildMenuView() {
  return Column(
    children: [
      Container(
        width: 355.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildMenuText("Choose your course"),
            GestureDetector(
              child: buildMenuText("See all", color: AppColors.primaryThreeElementText, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
      buildSubtitleText("Your Subtitle Here"),
    ],
  );
}

Widget buildSubtitleText(String text, {Color color = AppColors.primaryText, double fontSize = 16, FontWeight fontWeight = FontWeight.normal}) {
  return Container(
    margin: EdgeInsets.only(top: 20.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(7.w)),
      color: AppColors.primaryElement,
      border: Border.all(
        color: AppColors.primaryElement,
      ),
    ),
    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
      ),
    ),
  );
}

Widget buildMenuText(String text, {Color color = AppColors.primaryText, double fontSize = 16, FontWeight fontWeight = FontWeight.bold}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
    ),
  );
}
