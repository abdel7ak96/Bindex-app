import 'package:flutter/material.dart';
import 'views/login_view.dart';
// import 'views/main_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
      theme: ThemeData(
          colorScheme: ColorScheme(
              primary: const Color(0x00ba2981).withOpacity(1),
              primaryVariant: Colors.white,
              secondary: const Color(0x00ba2981).withOpacity(1),
              secondaryVariant: Colors.white,
              surface: Colors.white,
              background: Colors.white,
              error: const Color(0x00ba2981).withOpacity(1),
              onPrimary: Colors.white,
              onSecondary: Colors.white,
              onSurface: const Color(0x00ba2981).withOpacity(1),
              onBackground: const Color(0x00ba2981).withOpacity(1),
              onError: const Color(0x00ba2981).withOpacity(1),
              brightness: Brightness.light)),
    );
  }
}
