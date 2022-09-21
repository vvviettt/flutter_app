import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:sola/resources/screen/Login/LoginForm.dart';
import 'package:sola/resources/screen/Register/Register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
          backgroundColor: Color(0xFFF5F5F5),
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/circle_design.png"),
                    alignment: Alignment.topLeft)),
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              reverse: true,
              child: Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  const Text(
                    "Welcome back!",
                    style: TextStyle(
                        fontFamily: "Poppins", fontSize: 20, height: 1.5),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  const Image(image: AssetImage("assets/images/login.png")),
                  const SizedBox(
                    height: 57,
                  ),
                  const LoginForm(),
                  const SizedBox(
                    height: 31,
                  ),
                  SizedBox(
                    height: 87,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Don't have a account?"),
                        GestureDetector(
                          onTap: (() => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) =>
                                            const RegisterScreen()))
                              }),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 13,
                              color: Color(0xFF55847A),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                ],
              )),
            ),
          )),
    );
  }
}
