
import 'package:elearning_app_bloc/routes/pages.dart';

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
      providers: AppPages.allBlocProviders(context), 
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
          ),
          initialRoute: '/',
          onGenerateRoute: AppPages.GenerateRouteSettings,
            // Set the initial route if needed
          // routes: {
          //   'myHomePage': (context) => MyHomePage(),
          //   'signIn': (context) => SignInPage(),
          //   'register': (context) => RegisterScreen(),
          // },
        ),
      ),
    );
  }
}
