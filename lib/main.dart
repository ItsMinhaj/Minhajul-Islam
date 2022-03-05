import 'package:flutter/material.dart';
import 'package:minhajul_islam/theme/themes.dart';
import 'package:minhajul_islam/views/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Minhajul Islam',
      theme: ThemeData(colorScheme: const ColorScheme.light(primary: white)),
      home: Homepage(),
    );
  }
}
