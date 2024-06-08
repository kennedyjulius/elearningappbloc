import 'package:elearning_app_bloc/pages/others/authentication/bloc/sign_in_blocs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});


  Future<void> handleSignIn(String type) async {
    try {
      if (type=="email") {
        //BlocProvider.0f 
      final state = context.read<SignInBloc>().state;
      String emailAddress = state.email;
      String password = state.password;
      if (emailAddress.isEmpty) {
      //
      }
      if (password.isEmpty) {
      //
      }
      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailAddress, 
        password: password);
        if (credential.user==null) {
        
        }
        if (!credential.user!.emailVerified) {
        
        }
      } catch (e) {
        
      }
      }
    } catch (e) {
      
    }
  }
}