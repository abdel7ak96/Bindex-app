import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Views
import 'auth/login_view.dart';
import 'home/home_view.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final User? user = Provider.of<User?>(context);

    return user == null ? const LoginView() : const HomeView();
  }
}
