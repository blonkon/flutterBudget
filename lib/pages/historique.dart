import 'package:budgetflutter/model/depense.dart';
import 'package:budgetflutter/services/historique.dart';
import 'package:flutter/material.dart';

class historique extends StatefulWidget {
  const historique({super.key});

  @override
  State<historique> createState() => _historiqueState();
}

class _historiqueState extends State<historique> {
  // late Future futureDepense;

  @override
  void initState() {
    super.initState();
    // futureDepense = HistoriqueService().deleteDepense();
  }

  String? mois;

  final depenses = [
    {"categorie": "Loyer", "icon": "Alimentaire"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            "Historique",
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
          padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 100),
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
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.bottomRight,
                width: 500,
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: mois,
                  onChanged: (String? moisSelectionner) {
                    setState(() {
                      mois = moisSelectionner ?? "Selectionner un mois";
                    });
                  },
                  items: [
                    'Janvier',
                    'Fevrier',
                    'Mars',
                    'Avril',
                    'Mai',
                    'Juin',
                    'Juillet',
                    'Aout',
                    'Septembre',
                    'Octobre',
                    'Novembre',
                    'Decembre'
                  ]
                      .map((String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                  icon: const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: FutureBuilder<List<Depense>>(
                  future: HistoriqueService().list(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Erreur de chargement des données');
                    } else if (snapshot.data == null ||
                        snapshot.data!.isEmpty) {
                      return Text('Aucune dépense disponible');
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!
                            .length, // Utilisez la longueur des données dans le snapshot
                        itemBuilder: (context, index) {
                          final depenseObject = snapshot.data![index];
                          // final icon = depense['icon']; // Assurez-vous que 'icon' est un champ valide dans votre objet Depense
                          return Card(
                            child: ListTile(
                              leading:
                                  Image.asset("assets/images/historique.png"),
                              title: Text("${depenseObject.montant}"),
                              subtitle: Text("${depenseObject.date}"),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                color: Color.fromARGB(255, 173, 27, 1),
                                onPressed: () {
                                  // Afficher la boîte de dialogue de confirmation
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Confirmation'),
                                        content: Text(
                                            'Êtes-vous sûr de vouloir supprimer cette dépense ?'),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text('Annuler'),
                                            onPressed: () {
                                              // Fermer la boîte de dialogue
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text('Supprimer'),
                                            onPressed: () {
                                              // Supprimer la dépense et fermer la boîte de dialogue
                                              setState(() {
                                                HistoriqueService()
                                                    .deleteDepense(depenseObject
                                                        .idDepense!);
                                              });
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                        0xFF175419), // Changer la couleur de fond du bouton
                    foregroundColor:
                        Colors.white, // Changer la couleur du texte du bouton
                    textStyle: const TextStyle(fontSize: 12),
                    padding: const EdgeInsets.symmetric(
                        horizontal:
                            140), // Changer la taille du texte du bouton
                  ),
                  onPressed: () {
                    // Action à effectuer lors du clic sur le bouton
                  },
                  child: const Text('VIDER LA LISTE'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
