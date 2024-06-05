import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(child: Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildThirdPartLogin(context),
              const SizedBox(height: 10,),
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
                buildTextField("Email", "email")
              ],
            ),
          ),
            ],
          ),
        )
      )),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), 
          child: Container(
          color: Colors.grey.withOpacity(0.5),
          height: 1.0,
        )),
        title: Text("Log in",style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.normal
        ),),
      );
  }

   Widget buildThirdPartLogin (BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 40.h,
        bottom: 20.h,
      ),
      child: Row(
        children: [
          reusableIcons("google"),
          reusableIcons("apple"),
          reusableIcons("facebook"),
          
        ],
      ),
    );
   }

   Widget reusableIcons(String iconName){
    return GestureDetector(
      onTap: () {
        
      },
      child: SizedBox(
        width: 40.w,
        height: 40.w,
        child: Image.asset("assets/icons/${iconName}.png"),
      ),
    );
   }
      Widget reusableText(String text){
    return GestureDetector(
      onTap: () {
        
      },
      child: SizedBox(
        width: 40.w,
        height: 40.w,
        child: Text(text,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.grey.withOpacity(0.5)
        ),
        ),
      ),
    );
   }

   Widget buildTextField(String text, String textType){
    return Container(
      width: 325.w,
      height: 50.h,
      color: Colors.red,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(15.w),
        
        )
      ),
      child: Row(
        children: [
          Container(
            child: Image.asset("assets/icons/user.png"),
          )
        ],
      ),
    );
   }

   
}