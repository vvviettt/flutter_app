import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sola/resources/screen/Loading/Loading.dart';
import 'package:sola/resources/screen/Main/ListTodo.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _loading = false;

  @override
  void initState() {
    setState(() {
      _loading = true;
    });
    Timer(
        const Duration(seconds: 2),
        () => setState(() {
              _loading = false;
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? const Loading()
        : Scaffold(
            backgroundColor: const Color(0xFFF5F5F5),
            body: SingleChildScrollView(
                child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("assets/images/circle_design.png"),
                            alignment: Alignment.topLeft)),
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/images/heading.png"),
                          alignment: Alignment.topCenter,
                        )),
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          children: <Widget>[
                            const SizedBox(
                              height: 54,
                            ),
                            const SizedBox(
                              width: 119,
                              height: 119,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/avatar.jpg"),
                              ),
                            ),
                            const SizedBox(
                              height: 19,
                            ),
                            const Text(
                              "Welcome Van Viet",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Poppins",
                                  height: 1.5),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            const Image(
                                image: AssetImage("assets/images/main.png")),
                            Todos()
                          ],
                        )))));
  }
}
