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
      id: json['idDepenses'] ?? 0,
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
  int restant;

  Categorie({
    required this.titre,
    required this.id,
    required this.userid,
    required this.img,
    required this.date,
    required this.montant,
    required this.restant
  });

  factory Categorie.fromJson(Map<String, dynamic> json) {
    return Categorie(
      id: json['categorie']['idCategorie'] ?? 0,
      titre: json['categorie']['titre'] ?? '',
      userid: json['utilisateur']['idUtilisateur'],
      img:'',
      restant: json['montantRestant'] ?? 0,
      montant:json['montant'] ?? 0,
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
      'dateFin':date,
      'montantRestant':restant
    };
  }
}

class MontantModel extends ChangeNotifier {

  int CategorieId=0;
  double _montant = 0;
  double _montantcat=0;
  int USER_ID=1;
  String imgforliste = '';
  List<Depense> Depenses = [];
  List<Categorie> Categories = [];
  List<Depense> CategorieTrie = [];
  double Categoriesolde_restant = 0 ;
  MontantModel()  {
    // Appel de fetchAlbum() dans le constructeur pour initialiser _montant.
    fetchAlbum().then((double value) {
      _montant = value;
      notifyListeners();
    });
  }
  List<Depense> get Depensesget => Depenses;
  List<Depense> get CategorieTrieget => CategorieTrie ;
  List<Categorie> get Categoriesget => Categories;
  double get montant => _montant;
  double get montantcat => _montantcat;
  String get imgforlist => imgforliste;

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
  void Trieur(int id){
    this.CategorieTrie=[];
    this.Depenses.forEach((element) {
      if(element.categorieid==id){
        this.CategorieTrie.add(element);
      }
    });
  }
  void Trieurmontant(int id){
    this._montantcat=0;
    this.Depenses.forEach((element) {
      if(element.categorieid==id){
        this._montantcat=this._montantcat+element.montant;
      }
    });
    print(this._montantcat);
  }
  Future<void> deleted(Depense depense) async {
    if(depense.userid==this.USER_ID){
      final int id=depense.id;
      final responsecategorie = await http.delete(Uri.parse('http://10.0.2.2:8080/Depenses/delete/$id'));
      if(responsecategorie.statusCode==200){
        print("${responsecategorie.body}");
        // Supprimez la dépense de la liste Depenses
        Depenses.remove(depense);
        // Mettez à jour le montant total
        _montant -= depense.montant;
        _montantcat-= depense.montant;
        // Mettez à jour la liste CategorieTrie si nécessaire
        if (CategorieTrie.contains(depense)) {
          CategorieTrie.remove(depense);
        }
        notifyListeners();
      }
    }


  }
  String formatMontant(double montant) {
    if (montant < 1000) {
      return montant.toString()+" Fcfa";
    } else if (montant < 1000000) {
      double montantEnK = montant / 1000;
      return '${montantEnK.toStringAsFixed(2)}K';
    } else {
      double montantEnM = montant / 1000000;
      return '${montantEnM.toStringAsFixed(2)}M';
    }
  }
  void categoriesolde(int id){
    double test=0;
    this.Categories.forEach((element) {
      if(element.id==id&&element.userid==this.USER_ID){
        test=element.restant.toDouble();
        this.Categoriesolde_restant = test;

      }
    });

    notifyListeners();
  }
  }
