import 'dart:convert';

import 'package:budgetflutter/pages/ajoutCategorie.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:http/http.dart' as http;

class categorie extends StatefulWidget {
  const categorie({super.key});

  @override
  State<categorie> createState() => _categorieState();
}

// ignore: camel_case_types
class _categorieState extends State<categorie> {
  //pour stocker les donnees dans une liste
  List<dynamic> categorieList = [];

  @override
  void initState() {
    super.initState();
    //pour recuperer les donnees
    http.get(Uri.parse("http://10.0.2.2:8080/Categorie/lire")).then((resp) {
      // print(resp.body);
      //pour la mise a jour de affichage
      setState(() {
        //pour convertir en json en objet
        categorieList = jsonDecode(resp.body);

        print(categorieList);

        // print(categorieList);
      });
    }).catchError((err) {
      print('==========================erreur=============================');
      print(err);
    });
  }

  List<String> nomCategorie = [
    "Alimentaire",
    "Loyer",
    "Sport",
    "Sante",
    "Transport",
    "Loisir",
    "Voyage",
    "Scolarite"
  ];

  List image = [
    "assets/images/Alimentaire.png",
    "assets/images/iconLoyer.png",
    "assets/images/sport.png",
    "assets/images/loisir.png",
    "assets/images/transport.png",
    "assets/images/loisir.png",
    "assets/images/voyage.png",
    "assets/images/iconLoyer.png",
  ];

  final depenses = [
    {
      "categorie": "Alimentaire",
      "date": "30 sept. 2023",
      "icon": "Alimentaire"
    },
    {"categorie": "Loyer", "date": "30 sept. 2023", "icon": "iconLoyer"},
    {"categorie": "Transport", "date": "30 sept. 2023", "icon": "transport"},
    {"categorie": "Transport", "date": "30 sept. 2023", "icon": "transport"},
    {"categorie": "Transport", "date": "30 sept. 2023", "icon": "transport"},
    {"categorie": "Transport", "date": "30 sept. 2023", "icon": "transport"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            "Categorie",
            style: TextStyle(
              color: Color(0xFF175419),
              fontFamily: 'Poppins',
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        iconTheme: const IconThemeData(
          color:
              Color(0xFF175419), // Changer la couleur de l'icône de retour ici
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
          child: Column(
            children: [
              Container(
                height: 40,
                child: const TextField(
                  decoration: InputDecoration(
                    labelText: 'Rechercher...',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 25),
                child: const Text(
                  "Catégorie Par defaut",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: 370,
                      margin: const EdgeInsets.only(top: 15, bottom: 15),
                      decoration: BoxDecoration(
                          color: Color(0xFFE5E1E1),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2,
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1)
                          ]),
                      child: Column(children: [
                        GridView.builder(
                          itemCount: nomCategorie.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            // childAspectRatio: 4.1,
                          ),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  margin: const EdgeInsets.only(top: 24),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        image[index],
                                        width: 150,
                                      )
                                    ],
                                  ),
                                ),
                                // SizedBox(height: 1),
                                Text(
                                  nomCategorie[index],
                                  style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 30, 30, 30),
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            );
                          },
                        )
                      ]),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 25),
                child: const Text(
                  "Mes Catégories",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: categorieList.length,
                    itemBuilder: (context, index) {
                      final depense = depenses[index];
                      final icon = depense['icon'];
                      return Card(
                        child: ListTile(
                          leading: Image.asset("assets/images/$icon.png"),
                          title: Text('${categorieList[index]["titre"]}'),
                          trailing: PopupMenuButton<String>(
                            onSelected: (value) {
                              // Action à effectuer lorsque l'option du menu est sélectionnée
                              if (value == 'edit') {
                                // Mettez ici le code pour l'édition
                                print('Option d\'édition sélectionnée');
                              } else if (value == 'delete') {
                                // Mettez ici le code pour la suppression
                                print('Option de suppression sélectionnée');
                              }
                            },
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                              const PopupMenuItem<String>(
                                value: 'edit',
                                child: ListTile(
                                  leading:
                                      Icon(Icons.edit, color: Colors.amber),
                                  title: Text('Éditer'),
                                ),
                              ),
                              const PopupMenuItem<String>(
                                value: 'delete',
                                child: ListTile(
                                  leading:
                                      Icon(Icons.delete, color: Colors.red),
                                  title: Text('Supprimer'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF175419),
        hoverColor: Colors.white,
        child: Icon(
          Icons.add_outlined,
          color: Color(0xFFFFFFFF),
          size: 30,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ajoutCategorie()),
          );
        },
      ),
    );
  }
}

// Fonction pour afficher le popup d'options
Future<void> _showOptionsPopup(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Options'),
        content: Text('Contenu du popup'),
        actions: <Widget>[
          TextButton(
            child: Text('Fermer'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
