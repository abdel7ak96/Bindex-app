import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/login_background.jpg'),
                        fit: BoxFit.cover)),
                child: Center(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Image(
                        width: 200.0,
                        image: AssetImage('assets/images/bindex_logo.png'),
                      ),
                      const SizedBox(height: 80.0),
                      TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.emailAddress,
                        autofocus: false,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                        decoration: InputDecoration(
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
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.emailAddress,
                        autofocus: false,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                        decoration: InputDecoration(
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
                      const Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 18.0),
                      SizedBox(
                        width: double.infinity,
                        height: 45.0,
                        child: ElevatedButton(
                          onPressed: () => {},
                          child: const Text("Login"),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () => {},
                            child: const Text("Facebook"),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0)))),
                          ),
                          ElevatedButton(
                            onPressed: () => {},
                            child: const Text("Google"),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0)))),
                          )
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0
                        )
                      )
                    ],
                  ),
                ))),
          ),
        ),
      );
  }
}