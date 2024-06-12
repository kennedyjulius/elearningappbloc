import 'package:elearning_app_bloc/pages/others/authentication/bloc/register_blocs.dart';
import 'package:elearning_app_bloc/pages/others/authentication/widgets/flutter_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController(this.context);

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBlocs>().state;
    final String userName = state.username;
    final String email = state.email;
    final String password = state.password;
    final String confirmPassword = state.confirmPassword;

    // Validate form fields
    if (!validateInputs(userName, email, password, confirmPassword)) return;

    // Register user with Firebase
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Check if user was created successfully
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(msg: "An email verification has been sent to your email");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      handleFirebaseAuthException(e);
    }
  }

  bool validateInputs(String userName, String email, String password, String confirmPassword) {
    if (userName.isEmpty) {
      toastInfo(msg: "User name cannot be empty");
      return false;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email cannot be empty");
      return false;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password cannot be empty");
      return false;
    }
    if (confirmPassword.isEmpty) {
      toastInfo(msg: "Confirm password cannot be empty");
      return false;
    }
    if (password != confirmPassword) {
      toastInfo(msg: "Passwords do not match");
      return false;
    }
    return true;
  }

  void handleFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        toastInfo(msg: "The password is too weak");
        break;
      case 'email-already-in-use':
        toastInfo(msg: "The email entered is already in use");
        break;
      case 'invalid-email':
        toastInfo(msg: "This is an invalid email");
        break;
      case 'user-disabled':
        toastInfo(msg: "This user has been disabled");
        break;
      case 'too-many-requests':
        toastInfo(msg: "Too many requests. Try again later");
        break;
      case 'operation-not-allowed':
        toastInfo(msg: "Email/password accounts are not enabled");
        break;
      default:
        toastInfo(msg: "An unknown error occurred. Please try again");
    }
  }
}
