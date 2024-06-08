import 'package:elearning_app_bloc/pages/others/authentication/bloc/sign_in_blocs.dart';
import 'package:elearning_app_bloc/pages/others/authentication/signin_page.dart';
import 'package:elearning_app_bloc/pages/others/home_page.dart';
import 'package:elearning_app_bloc/pages/welcome/bloc/welcome_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WelcomeBloc()),
        BlocProvider(create: (context) => SignInBloc()),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
          ),
          initialRoute: 'signIn',  // Set the initial route if needed
          routes: {
            'myHomePage': (context) => MyHomePage(),
            'signIn': (context) => SignInPage(),
          },
        ),
      ),
    );
  }
}
