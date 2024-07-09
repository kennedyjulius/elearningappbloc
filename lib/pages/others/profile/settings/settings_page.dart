import 'dart:js_interop';

import 'package:elearning_app_bloc/global.dart';
import 'package:elearning_app_bloc/pages/others/authentication/bloc/home_event.dart';
import 'package:elearning_app_bloc/pages/others/authentication/widgets/custom_appbar.dart';
import 'package:elearning_app_bloc/pages/others/profile/settings/bloc/setting_states.dart';
import 'package:elearning_app_bloc/pages/others/profile/settings/bloc/settings_blocs.dart';
import 'package:elearning_app_bloc/routes/routes.dart';
import 'package:elearning_app_bloc/service/storage_service.dart';
import 'package:elearning_app_bloc/service/storage_service.dart';
import 'package:elearning_app_bloc/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../service/storage_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});


  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

void removeUserData(){
  Global.storageService.remove(AppConstants.STORAGE_USER_PROFILE_KEY);
  //BuildContext context;
  var context;
  context.read<AppBlocs>().add(TriggerAppEvent(0));
  Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
  Global.storageService.remove(AppConstants.STORAGE_USER_PROFILE_KEY);
  Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBlocs, SettingStates>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  settingsButton(context),
                  buildMenuText("Settings")
                ],
              ),
            );
          },),
      ),
    );
  }

Widget settingsButton(BuildContext context, void Function()? func) {
    return GestureDetector(
                  onTap: () {
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        title: Text("Confirm logout"),
                        content: Text("Confirm logout"),
                        actions: [
                          TextButton(onPressed: () {
                            Navigator.of(context).pop();
                          }, child: Text("Cancel")),

                            TextButton(onPressed: () {
                            func,
                          }, child: Text("Confirm")),
                        ],
                      );
                    },);
                  },
                  child: Container(
                    height: 100.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/icons/Logout.png"))
                    ),
                  ),
                );
  }
}