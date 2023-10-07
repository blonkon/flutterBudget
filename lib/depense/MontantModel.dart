import 'dart:convert';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class Depense {

  int id;
  int userid;
  int categorieid;
  String description;
  int montant;
  DateTime date;

  Depense({
    required this.description,
    required this.id,
    required this.montant,
    required this.date,
    required this.userid,
    required this.categorieid
  });

  factory Depense.fromJson(Map<String, dynamic> json) {
    return Depense(
      montant: json['montant'] ?? 0.0,
      id: json['id'] ?? 0,
      categorieid: json['budget']['categorie']['idCategorie'] ?? 0,
      description: json['description'] ?? '',
      userid: json['utilisateur']['idUtilisateur'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'montant': montant,
      'id': id,
      'description': description,
      'date':date,
      'userid':userid,
      'categorieid':categorieid
    };
  }
}
class Categorie{

  int id;
  String titre;
  int userid;

  Categorie({
    required this.titre,
    required this.id,
    required this.userid
  });

  factory Categorie.fromJson(Map<String, dynamic> json) {
    return Categorie(
      id: json['id'] ?? 0,
      titre: json['titre'] ?? '',
      userid: json['utilisateur']['idUtilisateur'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titre': titre,
      'userid':userid
    };
  }
}

class MontantModel extends ChangeNotifier {


  double _montant = 0;
  int USER_ID=1;
  List<Depense> Depenses = [];
  List<Categorie> Categories = [];
  MontantModel()  {

    // Appel de fetchAlbum() dans le constructeur pour initialiser _montant.
    fetchAlbum().then((double value) {
      _montant = value;
      notifyListeners();
    });
  }

  double get montant => _montant;

  void setMontant() {
    fetchAlbum().then((double value) {
      _montant = value;
      notifyListeners();
    });
  }
 Future<double> fetchAlbum() async {

   var box = await Hive.openBox('testBox');
   var name = box.get('test');

   print('Name: $name');
   final response = await http.get(Uri.parse('http://10.0.2.2:8080/Depenses/read'));
   double montant= 0;
   if (response.statusCode == 200) {
     final List<dynamic> jsonList = json.decode(response.body);
     final List<Depense> depenses = jsonList.map((json) => Depense.fromJson(json)).toList();
     // depenses.forEach((element) {print(element.montant);});
     this.Depenses = [];
     depenses.forEach((depense) {
       if(depense.userid==this.USER_ID){
         this.Depenses.add(depense);
       montant += depense.montant.toDouble();
       }
     });
      // this.Depenses.forEach((element) {print(element.categorieid);});
      // I'am trying to get all the categorie
     this.Categories=[];
     final responsecategorie = await http.get(Uri.parse("http://10.0.2.2:8080/Categorie/lire"));
     if(responsecategorie.statusCode==200){
       final List<dynamic> jsoncategorielist = json.decode(responsecategorie.body);
       final List<Categorie> categories = jsoncategorielist.map((e) => Categorie.fromJson(e)).toList();
       categories.forEach((element) {
         if(element.userid==this.USER_ID){
           this.Categories.add(element);
         }
       });
       // this.Categories.forEach((element) { print(element.titre);});
     }else{
       throw Exception('Erreur de requête HTTP : ${response.statusCode}');
     }
     return montant;
   } else {
     // Gérez les erreurs de requête HTTP ici, par exemple en lançant une exception
     throw Exception('Erreur de requête HTTP : ${response.statusCode}');
   }
 }
  }
