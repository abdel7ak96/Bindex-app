import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'views/login_view.dart';
import 'views/signup_view.dart';
// import 'views/main_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text("Has Error"),
              ),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const SignupView(),
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
        // Otherwise, show something whilst waiting for initialization to complete
        return const MaterialApp(
          home: Scaffold(
            body: Center(
              child: Text("Loading"),
            ),
          ),
        );
      },
    );
  }
}
