import 'package:flutter/material.dart';

const d_green = Color(0xFF175419);

void main() {
  runApp(ajout_budget());
}

class ajout_budget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: d_green,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 250),
              Text(
                'Budget',
                style: TextStyle(
                  color: d_green,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 0,
                child: Image.asset(
                  'assets/portefeuille.png',
                  width: 85,
                ),
                margin: EdgeInsets.only(top: 10),
              ),
              BudgetForm(),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class BudgetForm extends StatefulWidget {
  @override
  _BudgetFormState createState() => _BudgetFormState();
}

class _BudgetFormState extends State<BudgetForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _montantController = TextEditingController();
  TextEditingController _dateDebutController = TextEditingController();
  TextEditingController _montantAlerteController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  List<String> categories = [
    'Alimentation',
    'Loyer',
    'Transport',
    'Divertissement',
  ];

  String selectedCategory = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Champ 'Catégorie'
            TextFormField(
              controller: TextEditingController(
                text: selectedCategory.isNotEmpty
                    ? selectedCategory
                    : 'Sélectionner une catégorie',
              ),
              decoration: InputDecoration(
                labelText: 'Catégorie',
                prefixIcon: Icon(
                  Icons.category,
                  color: Color(0xFF175419),
                ),
                filled: true,
                fillColor: Color(0xFFF0F1F0),
              ),
              onTap: () {
                _showCategoryPicker();
              },
              readOnly: true,
              validator: (value) {
                if (value == 'Sélectionner une catégorie') {
                  return 'Veuillez sélectionner une catégorie';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),

            // Champ 'Montant'
            TextFormField(
              controller: _montantController,
              decoration: InputDecoration(
                labelText: 'Montant',
                prefixIcon: Icon(
                  Icons.attach_money,
                  color: Color(0xFF175419),
                ),
                filled: true,
                fillColor: Color(0xFFF0F1F0),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer le montant';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),

            // Champ 'Date de début'
            TextFormField(
              controller: _dateDebutController,
              decoration: InputDecoration(
                labelText: 'Date de début',
                prefixIcon: Icon(
                  Icons.calendar_today,
                  color: Color(0xFF175419),
                ),
                filled: true,
                fillColor: Color(0xFFF0F1F0),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer la date de début';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),

            // Champ 'Montant d'alerte'
            TextFormField(
              controller: _montantAlerteController,
              decoration: InputDecoration(
                labelText: 'Montant d\'alerte',
                prefixIcon: Icon(
                  Icons.warning,
                  color: Color(0xFF175419),
                ),
                filled: true,
                fillColor: Color(0xFFF0F1F0),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer le montant d\'alerte';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),

            // Champ de description
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description du budget',
                filled: true,
                fillColor: Color(0xFFF0F1F0),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 24.0),

            // Bouton d'enregistrement
            ElevatedButton(
              onPressed: () {
                // Vérifiez si le formulaire est valide
                if (_formKey.currentState!.validate()) {
                  // Effectuez l'enregistrement ici
                  // Vous pouvez accéder aux valeurs des champs avec _montantController.text, _dateDebutController.text, etc.
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: d_green,
              ),
              child: Text(
                'Enregistrer',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showCategoryPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sélectionner une catégorie'),
          content: SingleChildScrollView(
            child: Column(
              children: categories
                  .map(
                    (category) => ListTile(
                  title: Text(category),
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                    Navigator.pop(context);
                  },
                ),
              )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
