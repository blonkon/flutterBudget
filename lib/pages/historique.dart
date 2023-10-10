import 'package:budgetflutter/model/depense.dart';
import 'package:budgetflutter/services/historique.dart';
import 'package:flutter/material.dart';

class historique extends StatefulWidget {
  const historique({super.key});

  @override
  State<historique> createState() => _historiqueState();
}

class _historiqueState extends State<historique> {
  // late Future<Depense> futureDepense;

  @override
  void initState() {
    super.initState();
    // futureDepense = HistoriqueService().allDepense as Future<Depense>;
  }

  String? mois;
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
                      mois = moisSelectionner ?? 'Selectionner un mois';
                    });
                  },
                  items: [
                    'Jan',
                    'Fev',
                    'Mars',
                    'Avril',
                    'Mai',
                    'Jun',
                    'Jui',
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
                    future: HistoriqueService().allDepense(),
                    builder: (context, snapshot) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: depenses.length,
                          itemBuilder: (context, index) {
                            final depense = depenses[index];
                            final icon = depense['icon'];
                            return Card(
                              child: ListTile(
                                leading: Image.asset("assets/images/$icon.png"),
                                title: Text(
                                    "${snapshot.data![index].description}"),
                                subtitle: Text("${snapshot.data![index].date}"),
                                trailing: const Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 173, 27,
                                      1), // Changer la couleur de l'icône de retour ici
                                ),
                              ),
                            );
                          });
                    },
                  )),
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
