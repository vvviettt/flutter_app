import 'package:flutter/material.dart';
import 'package:sola/blocs/login_bloc.dart';
import 'package:sola/resources/common/Button.dart';
import 'package:sola/resources/screen/Main/Main.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _passwordVisible = false;
    });
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginBloc loginBloc = LoginBloc();
  void handle(BuildContext context) {
    if (loginBloc.isValid(_emailController.text, _passwordController.text)) {
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => const MainScreen()));
      _emailController.text = "";
      _passwordController.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Form(
        child: Center(
      child: Column(
        children: <Widget>[
          SizedBox(
              width: 340,
              // height: 43,
              child: StreamBuilder(
                builder: (context, snapshot) => TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter your email adress",
                      hintStyle:
                          const TextStyle(fontFamily: "Poppins", fontSize: 13),
                      border: InputBorder.none,
                      errorText:
                          snapshot.hasError ? snapshot.error.toString() : null),
                ),
                stream: loginBloc.emailStream,
              )),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
              width: 340,
              child: StreamBuilder(
                builder: (context, snapshot) => TextFormField(
                  controller: _passwordController,
                  obscureText: !_passwordVisible,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Password",
                    hintStyle:
                        const TextStyle(fontFamily: "Poppins", fontSize: 13),
                    border: InputBorder.none,
                    errorText:
                        snapshot.hasError ? snapshot.error.toString() : null,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black45,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
                stream: loginBloc.passwordStream,
              )),
          const SizedBox(
            height: 18,
          ),
          GestureDetector(
            onTap: (() => {print("object")}),
            child: const Text(
              "Forgot Password?",
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
          Button(text: 'Sign In', handle: () => handle(context)),
        ],
      ),
    )));
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}
