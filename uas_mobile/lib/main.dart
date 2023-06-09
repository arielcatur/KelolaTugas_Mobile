import 'package:flutter/material.dart';
import 'package:uas_mobile/login.dart';
import 'package:uas_mobile/halaman1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const Login(),
        "/halaman1": (context) => const TaskManagerApp(),
      },
    );
  }
}
