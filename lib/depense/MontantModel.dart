import 'dart:convert';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import 'MaBaseDeDonnees.dart';

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
  String img;
  DateTime date;
  int montant;

  Categorie({
    required this.titre,
    required this.id,
    required this.userid,
    required this.img,
    required this.date,
    required this.montant
  });

  factory Categorie.fromJson(Map<String, dynamic> json) {
    return Categorie(
      id: json['categorie']['idCategorie'] ?? 0,
      titre: json['categorie']['titre'] ?? '',
      userid: json['utilisateur']['idUtilisateur'],
      img:'',
      montant:json['montant'],
      date:DateTime.parse(json['dateFin'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titre': titre,
      'userid':userid,
      'img':img,
      'montant':montant,
      'dateFin':date
    };
  }
}

class MontantModel extends ChangeNotifier {

  int CategorieId=0;
  double _montant = 0;
  int USER_ID=1;
  List<Depense> Depenses = [];
  List<Categorie> Categories = [];
  List<Categorie> CategorieTrie = [];
  MontantModel()  {
    // Appel de fetchAlbum() dans le constructeur pour initialiser _montant.
    fetchAlbum().then((double value) {
      _montant = value;
      notifyListeners();
    });
  }
  List<Depense> get Depensesget => Depenses;
  List<Categorie> get CategorieTrieget => CategorieTrie ;
  List<Categorie> get Categoriesget => Categories;
  double get montant => _montant;

  void setMontant() {
    fetchAlbum().then((double value) {
      _montant = value;
      notifyListeners();
    });
  }
 Future<double> fetchAlbum() async {
   //MaBaseDeDonnees test = MaBaseDeDonnees(idcategorie: 2, img: "home.png");
   var box = await Hive.openBox<MaBaseDeDonnees>('userBox');
   //box.delete(4);
  // box.put(2, test);
   //test.idcategorie=4;
   //test.img = "hobby.png";
   //box.put(4, test);
   //test.idcategorie=3;
   //test.img = "sport.png";
   //box.put(3, test);
   //test.idcategorie=5;
   //test.img = "bus.png";
   //box.put(5, test);

 // var name = box.get(5);
 // var nam = name?.img;
 // print('Name: $nam');

   final response = await http.get(Uri.parse('http://10.0.2.2:8080/Depenses/read'));
   double montant= 0;

   if (response.statusCode == 200) {
     final List<dynamic> jsonList = json.decode(response.body);
     final List<Depense> depenses = jsonList.map((json) => Depense.fromJson(json)).toList();
     // depenses.forEach((element) {print(element.montant);});
     this.Depenses = [];
     depenses.forEach((depense) {
       if(depense.userid==this.USER_ID && depense.date.year==DateTime.now().year && depense.date.month==DateTime.now().month){
         this.Depenses.add(depense);
       montant += depense.montant.toDouble();
       }
     });
      // this.Depenses.forEach((element) {print(element.categorieid);});
      // I'am trying to get all the categorie from a budget of the current month
     this.Categories=[];
     final responsecategorie = await http.get(Uri.parse("http://10.0.2.2:8080/Budget/list"));
     if(responsecategorie.statusCode==200){
       final List<dynamic> jsoncategorielist = json.decode(responsecategorie.body);
       final List<Categorie> categories = jsoncategorielist.map((e) => Categorie.fromJson(e)).toList();
       categories.forEach((element) {
         if(element.userid==this.USER_ID && element.date.year==DateTime.now().year && element.date.month==DateTime.now().month){
            if(box.get(element.id)!=null){
              element.img = box.get(element.id)!.img;
            }
           this.Categories.add(element);
         }
       });
        this.Categories.forEach((element) { print(element.titre);});
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
