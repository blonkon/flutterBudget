import 'dart:convert';

import 'package:budgetflutter/model/budget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BudgetService {
  List<Budget> listsBudget = [];
  int sommeTotal = 0;
  Future<int> budget() async {
    final response = await http
        .get(Uri.parse('http://10.0.2.2:8080/budget/lire?idBudget=1'));

    if (response.statusCode == 200) {
      List result = jsonDecode(response.body);
      listsBudget = result.map((e) => Budget.fromJson(e)).toList();
      listsBudget.forEach((element) {
        sommeTotal = sommeTotal + element.montantRestant!;
      });
      print(sommeTotal);
      return sommeTotal;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Erreur de conversion !');
    }
  }
}
