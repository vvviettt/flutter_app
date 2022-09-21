import 'package:flutter/material.dart';
import 'package:sola/resources/screen/Login/Login.dart';
import 'package:sola/resources/screen/Register/RegisterForm.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/circle_design.png"),
                  alignment: Alignment.topLeft)),
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(height: 40),
                const Text(
                  "Welcome Onboard!",
                  style: TextStyle(
                      fontFamily: "Poppins", fontSize: 20, height: 1.5),
                ),
                const Text(
                  "Let’s help you meet up your task",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 13,
                      height: 4.3,
                      color: Color(0xFF55847A)),
                ),
                const SizedBox(
                  height: 57,
                ),
                const RegisterForm(),
                const SizedBox(
                  height: 31,
                ),
                SizedBox(
                  height: 87,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Aready have a account?"),
                      GestureDetector(
                        onTap: (() => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) =>
                                          const LoginScreen()))
                            }),
                        child: const Text(
                          "Sign In",
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
                )
              ],
            )),
          ),
        ));
  }
}
