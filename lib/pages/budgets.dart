import 'package:flutter/material.dart';
import 'ajout_budget.dart';
import 'budgetModel.dart';

const d_green = Color(0xFF175419);

void main() {
  runApp(MyAppss());
}

class MyAppss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0, // Pour supprimer l'ombre de l'AppBar si nécessaire
          backgroundColor: Colors.white, // Couleur de l'AppBar
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 36, // Largeur du conteneur
                  height: 36, // Hauteur du conteneur
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Forme du cercle
                    color: Colors.white, // Couleur du cercle
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/back.png', // Chemin vers l'image de retour
                      width: 24, // Largeur de l'image
                      height: 24, // Hauteur de l'image
                    ),
                  ),
                ),
              ),
              SizedBox(
                  width: 250), // Espace entre le bouton de retour et le texte
              Text(
                'Budget', // Texte "Budget"
                style: TextStyle(
                  color: d_green, // Couleur du texte "Budget"
                  fontSize: 20.0, // Taille de la police
                  fontWeight: FontWeight.bold, // Épaisseur de la police
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            FilterBar(), // Barre de filtrage en haut
            SearchBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Ajoutez le Card avec les colonnes ici
                    for (var budget in listeBudgets) CustomCard(budget: budget),
                  ],
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            // Rediriger vers la nouvelle page lorsque le bouton "plus" est appuyé
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ajout_budget(), // Remplacez "NouvellePage" par le nom de votre nouvelle page
              ),
            );
          },
          elevation: 0,
          child: Center(
            child: Image.asset('assets/images/ajout.png'),
          ),
          // Vous pouvez utiliser une autre icône ou une image à la place
        ),
      ),
    );
  }
}

class FilterBar extends StatefulWidget {
  @override
  _FilterBarState createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  String selectedMonth = 'Janvier'; // Mois par défaut

  List<String> months = [
    'Janvier',
    'Février',
    'Mars',
    'Avril',
    'Mai',
    'Juin',
    'Juillet',
    'Août',
    'Septembre',
    'Octobre',
    'Novembre',
    'Décembre',
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 7),
      elevation: 4,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.white, width: 1.0), // Style de la bordure
          borderRadius: BorderRadius.circular(4.0), // Coins arrondis
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.0), // Coins arrondis
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.0), // Espace interne
          child: DropdownButton<String>(
            value: selectedMonth,
            items: months.map((String month) {
              return DropdownMenuItem<String>(
                value: month,
                child: Text(month),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedMonth = newValue ?? 'Janvier';
              });
            },
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            elevation: 12,
            isExpanded: true,
            icon: Icon(Icons.arrow_drop_down, color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSearchPressed;

  SearchBar({this.onChanged, this.onSearchPressed});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Niveau d'élévation
      margin: EdgeInsets.all(12.0),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _textEditingController,
                onChanged: widget.onChanged,
                decoration: InputDecoration(
                  hintText: "Recherche...", // Texte d'indications
                  border: InputBorder.none, // Pas de bordure
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: widget.onSearchPressed,
            ),
          ],
        ),
      ),
    );
  }
}

List<BudgetModel> listeBudgets = [
  BudgetModel(
      categorie: 'Alimentation', montant: '50.000 FCFA', date: '30 sept. 2023'),
  BudgetModel(
      categorie: 'Loyer', montant: '40.000 FCFA', date: '15 sept. 2023'),
  BudgetModel(categorie: 'Sport', montant: '30.000 FCFA', date: '10 Oct. 2023'),
  BudgetModel(categorie: 'Sport', montant: '30.000 FCFA', date: '10 Oct. 2023'),
  BudgetModel(categorie: 'Sport', montant: '30.000 FCFA', date: '10 Oct. 2023'),
  BudgetModel(categorie: 'Sport', montant: '30.000 FCFA', date: '10 Oct. 2023'),
  BudgetModel(
      categorie: 'Alimentation', montant: '50.000 FCFA', date: '30 sept. 2023'),
  BudgetModel(
      categorie: 'Loyer', montant: '40.000 FCFA', date: '15 sept. 2023'),
  BudgetModel(
      categorie: 'Alimentation', montant: '50.000 FCFA', date: '30 sept. 2023'),
  BudgetModel(
      categorie: 'Loyer', montant: '40.000 FCFA', date: '15 sept. 2023'),
];

class CustomCard extends StatelessWidget {
  final BudgetModel budget;

  CustomCard({required this.budget});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Première colonne avec une image (vous pouvez garder cette partie)
            Image.asset('assets/images/iconalimentation.png'),

            // Deuxième colonne contenant le texte (utilisez les données du budget)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    budget.categorie,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    budget.date,
                    style: TextStyle(fontSize: 14.0, color: d_green),
                  ),
                ],
              ),
            ),

            // Troisième colonne avec le bouton d'options (les trois points verticaux)
            PopupMenuButton<String>(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: 'detail',
                    child: Row(
                      children: [
                        Icon(Icons.info),
                        SizedBox(width: 8.0),
                        Text('Détail'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'modifier',
                    child: Row(
                      children: [
                        Icon(Icons.edit),
                        SizedBox(width: 8.0),
                        Text('Modifier'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'supprimer',
                    child: Row(
                      children: [
                        Icon(Icons.delete),
                        SizedBox(width: 8.0),
                        Text('Supprimer'),
                      ],
                    ),
                  ),
                ];
              },
              onSelected: (value) {
                // Code à exécuter en fonction de l'option sélectionnée
                if (value == 'detail') {
                  // Action de détail
                } else if (value == 'modifier') {
                  // Action de modification
                } else if (value == 'supprimer') {
                  // Action de suppression
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}




/*class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Niveau d'élévation du Card

      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Première colonne avec une image
            Image.asset('assets/iconalimentation.png'),

            // Deuxième colonne contenant le texte (Alimentation et 30 sept. 2023)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alimentation',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '30 sept. 2023',
                    style: TextStyle(fontSize: 14.0,color: d_green),
                  ),
                ],
              ),
            ),

            // Troisième colonne avec le bouton d'options (les trois points verticaux)
            PopupMenuButton<String>(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: 'detail',
                    child: Row(
                      children: [
                        Icon(Icons.info),
                        SizedBox(width: 8.0),
                        Text('Détail'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'modifier',
                    child: Row(
                      children: [
                        Icon(Icons.edit),
                        SizedBox(width: 8.0),
                        Text('Modifier'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'supprimer',
                    child: Row(
                      children: [
                        Icon(Icons.delete),
                        SizedBox(width: 8.0),
                        Text('Supprimer'),
                      ],
                    ),
                  ),
                ];
              },
              onSelected: (value) {
                // Code à exécuter en fonction de l'option sélectionnée
                if (value == 'detail') {
                  // Action de détail
                } else if (value == 'modifier') {
                  // Action de modification
                } else if (value == 'supprimer') {
                  // Action de suppression
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}*/




