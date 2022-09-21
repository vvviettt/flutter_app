import 'package:flutter/material.dart';
import 'package:sola/resources/common/Button.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});
  @override
  State<StatefulWidget> createState() {
    return _StateRegistryForm();
  }
}

class _StateRegistryForm extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 300,
            height: 43,
            child: TextFormField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter your full Name",
                hintStyle: TextStyle(fontFamily: "Poppins", fontSize: 13),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: 300,
            height: 43,
            child: TextFormField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Enter your Email address",
                  hintStyle: TextStyle(fontFamily: "Poppins", fontSize: 13),
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: 300,
            height: 43,
            child: TextFormField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Create a Password",
                  hintStyle: TextStyle(fontFamily: "Poppins", fontSize: 13),
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: 300,
            height: 43,
            child: TextFormField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Confirm your Password",
                  hintStyle: TextStyle(fontFamily: "Poppins", fontSize: 13),
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          GestureDetector(
            onTap: (() => {print("object")}),
            child: const Text(
              "Fogot Password?",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 13,
                  color: Color(0xFF55847A),
                  height: 5.1),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Button(text: 'Sign In', handle: () => {print("login")}),
        ],
      ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
