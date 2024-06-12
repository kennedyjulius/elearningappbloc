import 'package:elearning_app_bloc/pages/others/authentication/bloc/register_blocs.dart';
import 'package:elearning_app_bloc/pages/others/authentication/bloc/sign_in_blocs.dart';
import 'package:elearning_app_bloc/pages/others/authentication/register.dart';
import 'package:elearning_app_bloc/pages/others/authentication/signin_page.dart';
import 'package:elearning_app_bloc/pages/others/home/homescreen.dart';
import 'package:elearning_app_bloc/pages/welcome/bloc/welcome_bloc.dart';
import 'package:elearning_app_bloc/pages/welcome/welcome.dart';
import 'package:elearning_app_bloc/routes/names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPages {
  // Define a list of PageEntity objects representing the routes in the app
  final List<PageEntity> routes = [
    PageEntity(
      route: AppRoutes.INITIAL,
      page: const Welcome(),
      bloc: BlocProvider(create: (_) => WelcomeBloc()),
    ),
    PageEntity(
      route: AppRoutes.REGISTER,
      page: const RegisterScreen(),
      bloc: BlocProvider(create: (_) => RegisterBlocs()),
    ),
    PageEntity(
      route: AppRoutes.SIGN_IN,
      page: const SignInPage(),
      bloc: BlocProvider(create: (_) => SignInBloc()),
    ),
    PageEntity(
      route: AppRoutes.APPLICATION,
      page: const Homescreen(), 
      //bloc: null,
      // Uncomment and provide appropriate BlocProvider if needed
       bloc: BlocProvider(create: (_) => SomeBloc()),
    ),
  ];

  // Static method to retrieve all BlocProviders from the routes
  static List<BlocProvider> allBlocProviders(BuildContext context) {
    List<BlocProvider> blocProviders = [];
    for (var route in AppPages().routes) {
      blocProviders.add(route.bloc);
    }
    return blocProviders;
  }
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings){
    if (settings.name!==null) {
    var result = routes().where((element) => element.route==settings.name);
    if (result.isNotEmpty) {
    return MaterialPageRoute(builder: (_)=>result.first.page, settings: settings);
    }
    }
    return MaterialPageRoute(
      builder: (_)=>SignInPage(), 
      settings: settings
      );
  }
}

// Class representing a page entity with route, page widget, and BlocProvider
class PageEntity {
  final String route;
  final Widget page;
  final BlocProvider bloc;

  PageEntity({
    required this.route,
    required this.page,
    required this.bloc,
  });
}