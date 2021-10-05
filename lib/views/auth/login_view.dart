// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../../services/auth.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

	String _email = '';
	String _password = '';

  bool validateEmail(email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {

    final AuthService auth = AuthService();

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/login_background.jpg'),
                        fit: BoxFit.cover)),
                child: Center(
                    child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Image(
                          width: 200.0,
                          image: AssetImage('assets/images/bindex_logo.png'),
                        ),
                        const SizedBox(height: 80.0),
                        TextFormField(
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !validateEmail(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
													onChanged: (value) {
														_email = value;
													},
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.emailAddress,
                          autofocus: false,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                          decoration: InputDecoration(
                              errorStyle:
                                  const TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.bold),
                              prefixIcon: const Icon(Icons.mail_outline,
                                  color: Colors.white),
                              hintText: 'Email',
                              hintStyle: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                              contentPadding: const EdgeInsets.fromLTRB(
                                  20.0, 13.0, 20.0, 10.0),
                              border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.4)),
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid password';
                            } else if (value.length < 8) {
                              return 'Password is at least 8 caracters long';
                            }
                            return null;
                          },
													onChanged: (value) {
														_password = value;
													},
													autovalidateMode: AutovalidateMode.onUserInteraction,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.emailAddress,
                          autofocus: false,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                          decoration: InputDecoration(
														errorStyle: const TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.bold),
                              prefixIcon: const Icon(Icons.lock_outline,
                                  color: Colors.white),
                              hintText: 'Password',
                              hintStyle: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                              contentPadding: const EdgeInsets.fromLTRB(
                                  20.0, 13.0, 20.0, 10.0),
                              border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.4)),
                        ),
                        const SizedBox(height: 6.0),
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {},
                            child: const Text(
                              "Forgot password?",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(height: 18.0),
                        SizedBox(
                          width: double.infinity,
                          height: 45.0,
                          child: ElevatedButton(
                            onPressed: () =>
                                {if (_formKey.currentState!.validate()) {
																	auth.signIn(_email, _password)
																}},
                            child: const Text("LOGIN"),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0)))),
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        const Text("Or login with",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        const SizedBox(height: 5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 100.0,
                              child: ElevatedButton(
                                onPressed: () => {},
                                child: const Text("Facebook",
                                    style: TextStyle(color: Colors.black)),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32.0)))),
                              ),
                            ),
                            SizedBox(
                              width: 100.0,
                              child: ElevatedButton(
                                onPressed: () => {},
                                child: const Text("Google",
                                    style: TextStyle(color: Colors.black)),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32.0)))),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: const Text("Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0)),
                        )
                      ],
                    ),
                  ),
                ))),
          ),
        ),
      ),
    );
  }
}
