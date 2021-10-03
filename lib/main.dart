import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// Views
import 'views/authentication/signup_view.dart';
import 'views/home/home_view.dart';
import 'views/authentication/login_view.dart';

//Wrapper
import 'views/wrapper.dart';

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
          return const ScreenHolder(text: "Has Error");
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const Wrapper(),
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
            routes: {
              '/signup' : (context) => const SignupView(),
              '/home' : (context) => const HomeView()
            },
          );
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return const ScreenHolder(text: 'Loading');
      },
    );
  }
}

class ScreenHolder extends StatelessWidget {
  const ScreenHolder({
    Key? key, this.text = 'Nothing'
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
