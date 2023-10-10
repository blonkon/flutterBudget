import 'package:flutter/material.dart';

import '../Statistique/chart_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<double> budgetValue = [
    4.40,
    2.40,
    99.40,
    74.40,
    48.40,
    94.40,
    34.40,
    49.40,
    88.40,
    30.40,
    24.40,
    14.40,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF175419),
        elevation: 0,
        title: const Text('Statistiques'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: 300,
          child: MyBarGraph(budgetValue: budgetValue),
        ),
      ),
    );
  }
}
