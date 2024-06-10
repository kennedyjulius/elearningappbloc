// ignore_for_file: prefer_const_constructors

import 'package:elearning_app_bloc/pages/others/authentication/auth_controller.dart';
import 'package:elearning_app_bloc/pages/others/authentication/bloc/sign_in_blocs.dart';
import 'package:elearning_app_bloc/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:elearning_app_bloc/pages/others/authentication/bloc/sign_in_event.dart';
import 'package:elearning_app_bloc/pages/others/authentication/bloc/sign_in_state.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildThirdPartLogin(context),
              const SizedBox(height: 10),
              reusableText("Or use your email account to login"),
              Container(
                margin: EdgeInsets.only(
                  top: 66.h,
                ),
                padding: EdgeInsets.only(
                  left: 25.w,
                  right: 25.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText("Email"),
                    SizedBox(height: 5.h,),
                    BlocBuilder<SignInBloc, SignInState>(
                      builder: (context, state) {
                        return buildTextField(
                          "Enter your Email address",
                          "email",
                          "user",
                          onChanged: (email) {
                            context.read<SignInBloc>().add(EmailEvent(email));
                          },
                          initialValue: state.email,
                        );
                      },
                    ),
                    reusableText("Password"),
                    SizedBox(height: 5.h,),
                    BlocBuilder<SignInBloc, SignInState>(
                      builder: (context, state) {
                        return buildTextField(
                          "Enter your Password",
                          "password",
                          "lock",
                          onChanged: (password) {
                            context.read<SignInBloc>().add(PasswordEvent(password));
                          },
                          initialValue: state.password,
                          obscureText: true,
                        );
                      },
                    ),
                    SizedBox(height: 10.h),
                    forgotPassword(),
                    SizedBox(height: 10.h,),
                    buildLogInAndRegButton("Login", "login", () {
                      // print("Log in Button");
                      SignInController(context: context).handleSignIn("email");
                    },),
                    buildLogInAndRegButton("Register", "register", () {
                      // print("Register button");
                    },),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Container(
          color: Colors.grey.withOpacity(0.5),
          height: 1.0,
        ),
      ),
      title: Center(
        child: Text(
          "Log in",
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget buildThirdPartLogin(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 40.h,
        bottom: 20.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          reusableIcons("google"),
          reusableIcons("apple"),
          reusableIcons("facebook"),
        ],
      ),
    );
  }

  Widget reusableIcons(String iconName) {
    return GestureDetector(
      onTap: () {
        // Add your onTap logic here
      },
      child: SizedBox(
        width: 40.w,
        height: 40.w,
        child: Image.asset("assets/icons/${iconName}.png"),
      ),
    );
  }

  Widget reusableText(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.grey.withOpacity(0.8),
        ),
      ),
    );
  }

  Widget buildTextField(String hinttext, String textType, String iconName, {required Function(String) onChanged, String? initialValue, bool obscureText = false}) {
    return Container(
      width: MediaQuery.of(context).size.width-20,
      height: 50.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
      ),
      child: Row(
        children: [
          Container(
            width: 16.w,
            margin: EdgeInsets.only(left: 17.w),
            height: 16.w,
            child: Image.asset("assets/icons/$iconName.png"),
          ),
          SizedBox(width: 8.w),
          SizedBox(
            height: 50.h,
            width: 270.w,
            child: TextField(
              keyboardType: TextInputType.multiline,
              style: TextStyle(
                fontFamily: "Avenir",
                fontSize: 14.sp,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
              autocorrect: false,
              obscureText: obscureText,
              onChanged: onChanged,
              controller: TextEditingController(text: initialValue),
              decoration: InputDecoration(
                hintText: hinttext,
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
          ),
        ],
      ),
    );
  }

  Widget forgotPassword() {
    return Container(
      margin: EdgeInsets.only(left: 25.w),
      width: 260.w,
      height: 44.h,
      child: GestureDetector(
        onTap: () {
          // Add your forgot password logic here
        },
        child: GestureDetector(
          onTap: () {
            
          },
          child: Text(
            "Forgot Password",
            style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.w200,
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue,
              fontSize: 12.sp,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLogInAndRegButton(String buttonName, String buttonType, void Function()? func) {
    return GestureDetector(
      onTap: () => func,
      child: Container(
        margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 40.h),
        width: 325.w,
        height: 50.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: buttonType == "login" ? AppColors.primaryElement : AppColors.primaryBackground,
          ),
          color: buttonType == "login" ? AppColors.primaryElement : AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.w),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),
              color: AppColors.primaryElement
            ),
          ]
        ),
        child: Center(
          child: Text(
            buttonName,
            style: TextStyle(
              color: buttonType == "login" ? AppColors.primaryBackground : AppColors.primaryText,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal
            ),
          ),
        ),
      ),
    );
  }
}
