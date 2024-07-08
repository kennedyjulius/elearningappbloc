import 'package:elearning_app_bloc/apis/user.api.dart';
import 'package:elearning_app_bloc/common/entities/user.dart';
import 'package:elearning_app_bloc/global.dart';
import 'package:elearning_app_bloc/pages/others/authentication/bloc/sign_in_blocs.dart';
import 'package:elearning_app_bloc/pages/others/authentication/widgets/flutter_toast.dart';
import 'package:elearning_app_bloc/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        // Retrieve the current state from the SignInBloc
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          toastInfo(msg: "You need to put an email address");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "You need to put an password");
          return;
        }

        try {
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

          if (credential.user == null) {
            toastInfo(msg: "User doesnot exist");
            return;
          }

          if (!credential.user!.emailVerified) {
            // Send email verification if not verified
            await credential.user!.sendEmailVerification();
            toastInfo(msg: "You need to verify your email account");
            return;
          }

          var user = credential.user;
          if (user != null) {
            asyncPostAllData(LoginRequestEntity as LoginRequestEntity);
            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.name = displayName;
            loginRequestEntity.avatar = photoUrl;
            loginRequestEntity.email = email;
            loginRequestEntity.open_id = id;
            loginRequestEntity.type = 1;

            toastInfo(msg: "Successful login");
            Global.storageService.setString(AppConstants.STORAGE_USER_PROFILE_KEY, "12345678" as bool);
            Navigator.of(context).pushNamedAndRemoveUntil("/homescreen", (route) => false,);
          } else {
            toastInfo(msg: "No user Found");
          }
        } on FirebaseAuthException catch (e) {
          switch (e.code) {
            case 'user-not-found':
              toastInfo(msg: "No user Found asscociated with that email");
              break;
            case 'wrong-password':
              toastInfo(msg: "You entered the wrong password");
              break;
            case 'invalid-email':
              toastInfo(msg: "This is an invalid email");
              break;
            case 'user-disabled':
              toastInfo(msg: "This user has been disabled");
              break;
            case 'too-many-requests':
              toastInfo(msg: "Tooo many requests");
              break;
            case 'operation-not-allowed':
              toastInfo(msg: "email/password not found");
              break;
            default:
              print("An undefined error happened: ${e.message}");
          }
        }
      }
    } catch (e) {
      print("An unexpected error occurred: $e");
    }
  }

  Future<void> asyncPostAllData(LoginRequestEntity LoginRequestEntity) async {
    EasyLoading.show(
      indicator: CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    var result = await UserApi.login(params: LoginRequestEntity);
  }
}
