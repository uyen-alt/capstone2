import 'package:flutter/material.dart';

import 'home_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of my application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter iSharing App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeContainerWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}
