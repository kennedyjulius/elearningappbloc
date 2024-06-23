import 'package:elearning_app_bloc/pages/others/authentication/widgets/custom_appbar.dart';
import 'package:elearning_app_bloc/pages/others/authentication/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildProfileAppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             profileIconAndEditButton(),
             Padding(
               padding: const EdgeInsets.only(left: 25),
               child: buildListView(context),
             )
            ],
          ),
        ),
      ),
    );
  }
}