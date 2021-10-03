import 'package:bindex/views/home/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bindex/views/authentication/signup_view.dart';

// Views
import 'authentication/login_view.dart';
// import 'authentication/signup_view.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SignupView();
  }
}
