import 'dart:convert';

import 'package:budgetflutter/model/budget.dart';
import 'package:budgetflutter/model/depense.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HistoriqueService {
  Future<List<Depense>> allDepense() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8083/depense/liste'));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => Depense.fromJson(e)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Erreur de conversion !');
    }
  }
}
