// ignore_for_file: unused_field, avoid_print

import 'package:flutter/material.dart';
import '../../services/auth.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();

  final AuthService auth = AuthService();

  String _fullname = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  bool validateEmail(email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
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
                            image: AssetImage(
                                'assets/images/login_background.jpg'),
                            fit: BoxFit.cover)),
                    child: Center(
                        child: SingleChildScrollView(
                            child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            hintText: 'Full name',
                            icon: Icons.person_outline,
                            onChange: (value) {
                              _fullname = value;
                            },
                          ),
                          const SizedBox(height: 15.0),
                          CustomTextFormField(
                            hintText: 'Email',
                            icon: Icons.email_outlined,
                            textInputType: TextInputType.emailAddress,
                            onChange: (value) {
                              _email = value;
                            },
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !validateEmail(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15.0),
                          CustomTextFormField(
                            hintText: 'Password',
                            icon: Icons.lock_outline,
                            textInputType: TextInputType.text,
                            obscureText: true,
                            onChange: (value) {
                              _password = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please fill this form field';
                              } else if (value.length < 8) {
                                return 'Passwords need to be at least 8 caracters long';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15.0),
                          CustomTextFormField(
                            hintText: 'Confirm password',
                            icon: Icons.lock_outline,
                            textInputType: TextInputType.text,
                            obscureText: true,
                            onChange: (value) {
                              _confirmPassword = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please fill this form field';
                              } else if (value.length < 8) {
                                return 'Passwords need to be at least 8 caracters long';
                              } else if(value != _password) {
                                return 'Password is not identical';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20.0),
                          SizedBox(
                            width: double.infinity,
                            height: 50.0,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  auth.signUp(_email, _password);
                                }
                              },
                              child: const Text('Sign up',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w700)),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  elevation: MaterialStateProperty.all(0.0),
                                  side: MaterialStateProperty.all(
                                      BorderSide.lerp(
                                          const BorderSide(
                                              style: BorderStyle.solid,
                                              color: Colors.white,
                                              width: 3.0),
                                          const BorderSide(
                                              style: BorderStyle.solid,
                                              color: Colors.white,
                                              width: 3.0),
                                          10.0)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ))),
                            ),
                          )
                        ],
                      ),
                    ))),
                  )))),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      required this.hintText,
      this.icon = Icons.adb_sharp,
      this.textInputType = TextInputType.text,
      this.obscureText = false,
      this.validator,
      this.onChange})
      : super(key: key);

  final String hintText;
  final IconData icon;
  final TextInputType textInputType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      keyboardType: textInputType,
      autofocus: false,
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please fill this form field';
            }
            return null;
          },
      onChanged: onChange,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      obscureText: obscureText,
      decoration: InputDecoration(
          errorStyle: const TextStyle(
              color: Colors.orangeAccent, fontWeight: FontWeight.bold),
          prefixIcon: Icon(icon, color: Colors.white),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white, fontSize: 16),
          contentPadding: const EdgeInsets.fromLTRB(20.0, 13.0, 20.0, 10.0),
          border:
              UnderlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          filled: true,
          fillColor: Colors.white.withOpacity(0.4)),
    );
  }
}
