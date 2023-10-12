import 'dart:convert';

import 'package:budgetflutter/model/depense.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HistoriqueService {
  // methode de recuperer de depense dont le buget n'est pas encore

  List<Depense> listsDepense = [];
  List<Depense> depenseList = [];
  int mois = DateTime.now().month;

  Future<List<Depense>> list() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8083/depense/liste'));

    if (response.statusCode == 200) {
      List result = jsonDecode(response.body);
      listsDepense = result.map((e) => Depense.fromJson(e)).toList();
      listsDepense.forEach((element) {
        DateTime date = DateTime.parse(element.date!);
        if (date.month != mois) {
          depenseList.add(element);
        }
      });
      return depenseList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Erreur de conversion !');
    }
  }

  // reperation de depense avec id
  Future<Depense> deleteDepense(int idDepense) async {
    final http.Response response = await http.delete(
      Uri.parse(
          'http://10.0.2.2:8083/depense/supprimer?idDepense=${idDepense}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print(response.body);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON. After deleting,
      // you'll get an empty JSON `{}` response.
      // Don't return `null`, otherwise `snapshot.hasData`
      // will always return false on `FutureBuilder`.
      return Depense.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a "200 OK response",
      // then throw an exception.
      throw Exception('Failed to delete ');
    }
  }
}
