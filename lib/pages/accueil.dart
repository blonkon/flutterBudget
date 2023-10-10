import 'package:budgetflutter/pages/alerte.dart';
import 'package:budgetflutter/pages/categorie.dart';
import 'package:budgetflutter/pages/home_graph.dart';
import 'package:budgetflutter/pages/profil.dart';
import 'package:budgetflutter/widget/home.dart';
import 'package:budgetflutter/pages/historique.dart';
import 'package:budgetflutter/pages/statistique.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class accueil extends StatefulWidget {
  const accueil({super.key});

  @override
  State<accueil> createState() => _accueilState();
}

class _accueilState extends State<accueil> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const home(),
    alerte(),
    const HomePage(),
  ];

  void _chnagerPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0xFF175419),
        animationDuration: Duration(milliseconds: 250),
        height: 45,
        items: const [
          Icon(Icons.home),
          Icon(Icons.add_alert),
          Icon(Icons.bar_chart),
        ],
        onTap: _chnagerPage,
      ),
    );
  }
}
