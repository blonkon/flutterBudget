import 'package:budgetflutter/pages/ConnexionPage.dart';
import 'package:budgetflutter/pages/InscriptionPage.dart';
import 'dart:convert';
import 'dart:ffi';

import 'package:budgetflutter/model/budget.dart';
import 'package:budgetflutter/pages/alerte.dart';
import 'package:budgetflutter/pages/categorie.dart';
import 'package:budgetflutter/pages/home_graph.dart';
import 'package:budgetflutter/pages/profil.dart';
import 'package:budgetflutter/widget/home.dart';
import 'package:budgetflutter/pages/historique.dart';
import 'package:budgetflutter/pages/statistique.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class accueil extends StatefulWidget {
  const accueil({super.key});

  @override
  State<accueil> createState() => _accueilState();
}

class _accueilState extends State<accueil> {
  List<Budget> listBudget = [];
  int index = 0;
  int montantRestant = 0;
  DateTime now = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    http.get(Uri.parse("http://10.0.2.2:8083/budget/afficher")).then((resp) {
      setState(() {
        List<dynamic> dynamicList =
            json.decode(resp.body); //  DateTime dateDebut =

        // if () {

        // }
        // int sommmeMontant;
        List<Budget> listBudget =
            dynamicList.map((json) => Budget.fromJson(json)).toList();

        List<Budget> budgetsMoisCourant = listBudget;

        int sommeMontantsRestantsMoisCourant = budgetsMoisCourant
            .map<int>((budget) => budget.montantRestant ?? 0)
            .reduce((value, element) => value + element);

        print('somme des montants restants: $sommeMontantsRestantsMoisCourant');
      });
    });
  }

  int _currentIndex = 0;

  final List<Widget> _pages = [
    const home(),
    alerte(),
    const ConnexionPage(),
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
