import "package:flutter/material.dart";
import "home_screen.dart";

class GmailCloneApp extends StatelessWidget {
  const GmailCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gmail Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.light,
      ),
      home: const HomeScreen(),
    );
  }
}
