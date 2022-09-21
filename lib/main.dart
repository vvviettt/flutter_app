import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sola/app.dart';
import 'package:sola/resources/screen/GettingStarted/Started.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const App());
}
