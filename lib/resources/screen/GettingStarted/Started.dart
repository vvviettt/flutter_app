import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sola/resources/common/Button.dart';
import 'package:sola/resources/screen/Login/Login.dart';

class Started extends StatelessWidget {
  const Started({super.key});
  static void handle(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (builder) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Image(image: AssetImage("assets/images/started.png")),
            const SizedBox(
              height: 43,
            ),
            const Text("Getting done with Todo",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins")),
            const SizedBox(
              height: 18,
            ),
            const SizedBox(
              width: 255,
              child: Text(
                "Lorem ipsum dolor sit amet,consectetur adipisicing. Maxime,tempore! Animi nemo aut atque,deleniti nihil dolorem repellendus.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, height: 1.6),
              ),
            ),
            const SizedBox(
              height: 56,
            ),
            Button(
              text: "Get Started",
              handle: () => {handle(context)},
            )
          ],
        ),
      ),
    );
  }
}
