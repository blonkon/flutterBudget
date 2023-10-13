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
                    child: Icon(
                      Icons.arrow_back,
                      color: d_green,
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
      categorie: 'Alimentation',
      montant: '50.000 FCFA',
      montant_restant: '50.000 FCFA',
      date: '30 sept. 2023',
      description: 'ce budget est reservé pour l\'alimentation'),
  BudgetModel(
      categorie: 'Loyer',
      montant: '40.000 FCFA',
      montant_restant: '40.000 FCFA',
      date: '15 sept. 2023',
      description: 'ce budget est reservé pour le loyer'),
  BudgetModel(
      categorie: 'Sport',
      montant: '30.000 FCFA',
      montant_restant: '30.000 FCFA',
      date: '10 Oct. 2023',
      description: 'ce budget est reservé pour le Sport'),
  BudgetModel(
      categorie: 'Education',
      montant: '30.000 FCFA',
      montant_restant: '30.000 FCFA',
      date: '10 Oct. 2023',
      description: 'ce budget est reservé pour l\'education'),
  BudgetModel(
      categorie: 'Transport',
      montant: '20.000 FCFA',
      montant_restant: '30.000 FCFA',
      date: '10 Oct. 2023',
      description: 'ce budget est reservé pour le transport'),
  BudgetModel(
      categorie: 'Divertissement',
      montant: '60.000 FCFA',
      montant_restant: '30.000 FCFA',
      date: '10 Oct. 2023',
      description: 'ce budget est reservé pour le divertissement'),
];

class CustomCard extends StatelessWidget {
  final BudgetModel budget;

  CustomCard({required this.budget});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
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
                        Icon(Icons.info, color: d_green),
                        SizedBox(width: 8.0),
                        Text('Détail'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'modifier',
                    child: Row(
                      children: [
                        Icon(Icons.edit, color: d_green),
                        SizedBox(width: 8.0),
                        Text('Modifier'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'supprimer',
                    child: Row(
                      children: [
                        Icon(Icons.delete, color: d_green),
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
                  // Afficher les détails du budget lorsque l'option "Détail" est sélectionnée
                  showDialog(
                    context: context,
                    builder: (context) {
                      return BudgetDetail(
                          budget: budget); // Utilisez le widget BudgetDetail
                    },
                  );
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

class BudgetDetail extends StatelessWidget {
  final BudgetModel budget;

  BudgetDetail({required this.budget});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: d_green, // Couleur d'arrière-plan pour la partie supérieure
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Détails du budget',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close,
                          color: Colors.white), // Icône de fermeture
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Catégorie: ${budget.categorie}'),
                Text('Montant: ${budget.montant}'),
                Text('Montant Restant: ${budget.montant_restant}'),
                Text('Date: ${budget.date}'),
                Text('Description: ${budget.description}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
