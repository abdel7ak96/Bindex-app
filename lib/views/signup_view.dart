import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({ Key? key }) : super(key: key);

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
                  image: AssetImage('assets/images/login_background.jpg'),
                  fit: BoxFit.cover
                )
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const CustomTextFormField(
                        hintText: 'Full name',
                        icon: Icons.person_outline
                      ),
                      const SizedBox(height: 15.0),
                      const CustomTextFormField(
                        hintText: 'Email',
                        icon: Icons.email_outlined,
                        textInputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 15.0),
                      const CustomTextFormField(
                        hintText: 'Password',
                        icon: Icons.lock_outline,
                        textInputType: TextInputType.text,
                        obscureText: true,
                      ),
                      const SizedBox(height: 15.0),
                      const CustomTextFormField(
                        hintText: 'Confirm password',
                        icon: Icons.lock_outline,
                        textInputType: TextInputType.text,
                        obscureText: true,
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity,
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700
                            )
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.transparent),
                            elevation: MaterialStateProperty.all(0.0),
                            side: MaterialStateProperty.all(
                              BorderSide.lerp(
                                const BorderSide(
                                  style: BorderStyle.solid,
                                  color: Colors.white,
                                  width: 3.0
                                ),
                                const BorderSide(
                                  style: BorderStyle.solid,
                                  color: Colors.white,
                                  width: 3.0
                                ),
                                10.0
                              )
                            ),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              )
                            )
                          ),
                        ),
                      )
                    ],
                  )
                )
              ),
            )
          )
        )
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key, required this.hintText, this.icon = Icons.adb_sharp, this.textInputType = TextInputType.text, this.obscureText = false
  }) : super(key: key);

  final String hintText;
  final IconData icon;
  final TextInputType textInputType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      keyboardType: textInputType,
      autofocus: false,
      style:
          const TextStyle(color: Colors.white, fontSize: 16),
          obscureText: obscureText,
      decoration: InputDecoration(
          prefixIcon: Icon(icon,
              color: Colors.white),
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Colors.white, fontSize: 16),
          contentPadding: const EdgeInsets.fromLTRB(
              20.0, 13.0, 20.0, 10.0),
          border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(32.0)),
          filled: true,
          fillColor: Colors.white.withOpacity(0.4)),
    );
  }
}