import 'dart:convert';

import 'package:budgetflutter/model/budget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BudgetService {
  Future<Budget> budget() async {
    final response = await http
        .get(Uri.parse('http://10.0.2.2:8083/budget/lire?idBudget=1'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Budget.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Erreur de conversion !');
    }
  }
}
