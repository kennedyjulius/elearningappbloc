import 'package:elearning_app_bloc/global.dart';
import 'package:elearning_app_bloc/routes/pages.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  // Initialize any global dependencies or settings
  await Global.init();

  // Run the application
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppPages.allBlocProviders(context), 
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // Use Material 3 design system if available
            useMaterial3: true,
          ),
          initialRoute: '/', // Set the initial route
          onGenerateRoute: AppPages.generateRouteSettings, // Define route generation logic
          // Define named routes if needed
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
