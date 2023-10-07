import 'package:budgetflutter/User/InscriptionPage.dart';
import 'package:flutter/material.dart';
import 'User/InscriptionPage.dart';

void main() {
  runApp(const MyApp());
}

//test
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Musaka',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: InscriptionPage(),
    );
  }
}
