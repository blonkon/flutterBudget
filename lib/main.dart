import 'package:budgetflutter/model/budget.dart';
import 'package:budgetflutter/pages/accueil.dart';
import 'package:budgetflutter/widget/home.dart';
import 'package:budgetflutter/pages/historique.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Gestion budget',
      debugShowCheckedModeBanner: false,
      home: accueil(),
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: accueil(),
//     );
//   }
// }


