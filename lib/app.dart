import 'package:flutter/material.dart';
import 'package:update_sample/feature/top_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TopPage(),
    );
  }
}
