import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sola/provider/totoListProvider.dart';
import 'package:sola/resources/screen/GettingStarted/Started.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => TodoListProvider()))
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Started()),
    );
  }
}
