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
      print("email is empty");
      }
      if (password.isEmpty) {
      //
      print("password is empty");
      }
      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailAddress, 
        password: password);
        if (credential.user==null) {
        print("user does not exist");
        }
        if (!credential.user!.emailVerified) {
        print("user not verified");
        }
        var user = credential.user;
        if (user!=null) {
        print("User does exist");
        }else{
          print("no user");
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
        print("No user found associated with that email");
        }else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user');
        }else if (e.code=='invalid-email') {
        print("Your email format is wrong");
        }
      }
      }
    } catch (e) {
      
    }
  }
}