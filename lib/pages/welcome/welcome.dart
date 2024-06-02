import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          width: 375.w,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                children: [
                 _page(
                  1,
                  context,
                  "next",
                  "First See Learning",
                  "Forget about a for of a paper all knowledge is on learning",
                  "image path"
                 ),
                  _page(
                  2,
                  context,
                  "next",
                  "connect with everyone",
                  "Always Keep in Touch with your Tutor & Friend . lets get connected",
                  "image path"
                 ),
                  _page(
                  3,
                  context,
                  "next",
                  "Always Fascinated Learning",
                  "Anywhere, anytime. The time isat our desertion.",
                  "image path"
                 ),
                ],
              ),
              //dots indicator
              Positioned(
                bottom: 100.h,
                child: DotsIndicator(
                  dotsCount: 3, 
                  mainAxisAlignment: MainAxisAlignment.center,
                  decorator: DotsDecorator(
                    color: Colors.blue,
                    activeColor: Colors.grey,
                    size: Size.square(8.0),
                    activeSize: Size(10.0, 8.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),

                    )
                  ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title, String subTitle, String imagePath){
    return Column(
                    children: [
                      SizedBox(
                        width: 345.w,
                        height: 345.w,
                        child: Image.asset(imagePath),
                      ),
                      Container(
                        child: 
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.normal,
                            color: Colors.black
                          ),
                        ),
                        
                      ),
                      Container(
                        width: 375.w,
                        padding: EdgeInsets.only(left: 30.w, right:  30.w),
                        child: 
                        Text(
                          subTitle,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal,
                            color: Colors.black.withOpacity(0.5)
                          ),
                        ), 
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
                        width: 325.w,
                        height: 50.h,
                        color: Colors.redAccent,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.w),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 10)
                            )
                          ]
                        ),
                        child: Center(
                          child: Text(
                          buttonName,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                            color: Colors.white.withOpacity(0.5)
                          ),
                        ),
                        ),
                        
                      )
                    ],
                  );
  }
}