import 'package:flutter/material.dart';
import 'package:github_mobile/pages/home/home.dart';
import 'package:github_mobile/pages/users/users.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      routes: {
        "/": (context) => const HomePage(),
        "/users": (context) => UsersPage()
      },
      initialRoute: "/users",
    );
  }
}
