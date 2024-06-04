import 'package:dots_indicator/dots_indicator.dart';
import 'package:elearning_app_bloc/pages/welcome/bloc/welcome_bloc.dart';
import 'package:elearning_app_bloc/pages/welcome/bloc/welcome_events.dart';
import 'package:elearning_app_bloc/pages/welcome/bloc/welcome_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  PageController pageController = PageController(viewportFraction: 1, initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: pageController,
                    physics: AlwaysScrollableScrollPhysics(),
                    onPageChanged: (index) {
                      print("Index value is ${index}");
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    },
                    children: [
                     _page(
                      1,
                      context,
                      "next",
                      "First See Learning",
                      "Forget about a for of a paper all knowledge is on learning",
                      "assets/images/reading.png"
                     ),
                      _page(
                      2,
                      context,
                      "next",
                      "connect with everyone",
                      "Always Keep in Touch with your Tutor & Friend . lets get connected",
                      "assets/images/boy.png"
                     ),
                      _page(
                      3,
                      context,
                      "next",
                      "Always Fascinated Learning",
                      "Anywhere, anytime. The time isat our desertion.",
                      "assets/images/man.png"
                     ),
                    ],
                  ),
                  //dots indicator
                  Positioned(
                    bottom: 100.h,
                    child: DotsIndicator(
                      position: state.page,
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
            );
          }
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
                        child: Image.asset(imagePath, fit: BoxFit.cover,),
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

                      GestureDetector(
                        onTap: () {
                          //within 0-2 index
                          if (index<3) {
                            pageController.animateTo(0, 
                            duration: Duration(milliseconds: 5000), 
                            curve: Curves.decelerate);
                          //animation
                          }else{
                            //jump to anew page
                            Navigator.of(context).pushNamedAndRemoveUntil("myHomePage", (route) => false);
                          }
                        },
                        child: Container(
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
                          
                        ),
                      )
                    ],
                  );
  }
}