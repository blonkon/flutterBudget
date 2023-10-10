import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class alerte extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<alerte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 254, 254),
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AlarmWidget(),
            ListeWidget(),
          ],
        ),
      ),
    );
  }
}

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(50);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Alerte',
        style: GoogleFonts.aBeeZee(
          color: Color.fromARGB(255, 23, 84, 25),
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
    );
  }
}
// class AlarmWidget extends StatefulWidget {
//   @override
//   _AlarmWidgetState createState() => _AlarmWidgetState();
// }

class AlarmWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Image.asset("assets/alarme.png"),
    );
  }
}

class ListeWidget extends StatefulWidget {
  @override
  _ListeWidgetState createState() => _ListeWidgetState();
}

class _ListeWidgetState extends State<ListeWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: ListTile(
                leading: Image.asset("assets/iconjaune.png"),
                title: Text("Alimentaire"),
                subtitle: Text("Date"),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                  onPressed: () {
                    _afficherBoiteDialogue(context);
                  },
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Image.asset("assets/iconrouge.png"),
                title: Text("Alimentaire"),
                subtitle: Text("Date"),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                  onPressed: () {
                    _afficherBoiteDialogue(context);
                  },
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Image.asset("assets/iconjaune.png"),
                title: Text("sport"),
                subtitle: Text("Date"),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                  onPressed: () {
                    _afficherBoiteDialogue(context);
                  },
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Image.asset("assets/iconrouge.png"),
                title: Text("sport"),
                subtitle: Text("Date"),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                  onPressed: () {
                    _afficherBoiteDialogue(context);
                  },
                ),
              ),
            ),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                // Action à effectuer lorsque le bouton est pressé
              },
              child: Text('vider'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 23, 84, 25),
                fixedSize: Size(400, 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fonction pour afficher la boîte de dialogue de confirmation
  Future<void> _afficherBoiteDialogue(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(''),
          content: Text('Voulez-vous tous supprimer  ?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fermez la boîte de dialogue
              },
              child: Text('Non'),
            ),
            TextButton(
              onPressed: () {
                // Ajoutez l'action de suppression ici
                setState(() {
                  // Supprimez l'élément de votre liste ou effectuez l'action de suppression appropriée
                });
                Navigator.of(context).pop(); // Fermez la boîte de dialogue
              },
              child: Text('Oui'),
            ),
          ],
        );
      },
    );
  }
}
