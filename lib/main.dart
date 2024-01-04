import 'package:flutter/material.dart';
import 'package:mindshare_ai/screens/homePage.dart';
import 'package:mindshare_ai/screens/profilePage.dart';

void main() {
  runApp(const MindShareApp());
}

class MindShareApp extends StatelessWidget {
  const MindShareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/profile': (context) => ProfilePage(account: 1),
      },

      title: 'Mindshare AI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
