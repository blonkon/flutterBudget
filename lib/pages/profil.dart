import 'dart:ffi';

import 'package:budgetflutter/pages/modifierProfil.dart';
import 'package:flutter/material.dart';

class UserProfil extends StatefulWidget {
  const UserProfil({Key? key}) : super(key: key);

  @override
  State<UserProfil> createState() => _UserProfilState();
}

class _UserProfilState extends State<UserProfil> {
  @override
  void initState() {
    super.initState();
  }

  String evaluer = '';
  void partagerApplication() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF175419),
        elevation: 0,
        title: Center(
          child: Text(
            "Profil",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back_rounded, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 7,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35.5),
                      bottomRight: Radius.circular(35.5),
                    ),
                    color: Color(0xFF175419),
                  ),
                ),
                Positioned(
                  bottom: -80.0,
                  child: InkWell(
                    child: ClipOval(
                      child: Container(
                        width: 120,
                        height: 120,
                        color: Colors.blueAccent,
                        child: Image.network(
                          'https://www.pngall.com/wp-content/uploads/8/Young-Man-PNG-Free-Image.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                //icone du boutton modifier profile
                Positioned(
                  bottom: -5,
                  right: 150,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => EditUserProfil()),
                      );
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 4, color: Colors.white38),
                        color: Colors.white70,
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Color(0xFF175419),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 55,
            ),

            Transform.translate(
              offset: Offset(0 ,30),
              child:
            Text("Souleymane Fomba",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                )),),

            Padding(
              padding: EdgeInsets.all(20.0),
              child: Padding(
                padding: EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    Card(
                      elevation: 8,
                      child: ListTile(
                        onTap: () async {
                          final evaluer = await EvaluerApp();
                          if (evaluer == null || evaluer.isEmpty) return;
                        },
                        leading: Icon(
                          Icons.bookmark_add_sharp,
                          color: Colors.green,
                        ),
                        title: Text("Evaluer l'Application"),
                        tileColor: Colors.white,
                      ),
                    ),
                    Card(
                      elevation: 8,
                      child: ListTile(
                        onTap: partagerApplication,
                        leading: Icon(
                          Icons.share,
                          color: Colors.blue,
                        ),
                        title: Text("Partager l'application"),
                        tileColor: Colors.white,
                      ),
                    ),

                    Card(
                      elevation: 8,
                      child: ListTile(
                        onTap: () {
                          Apropos();
                        },
                        leading: Icon(
                          Icons.help_outline,
                          color: Colors.black,
                        ),
                        title: Text("A Propos"),
                        tileColor: Colors.white,
                      ),
                    ),
                    Card(
                      elevation: 8,
                      child: ListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.delete_forever_rounded,
                          color: Colors.red,
                        ),
                        title: Text("Demander la Suppression de mon Compte"),
                        tileColor: Colors.white,
                      ),
                    ),
                    Card(
                      elevation: 8,
                      margin: EdgeInsets.only(top: 50),
                      child: ListTile(
                        onTap: () {},
                        title: Center(
                          child: Text(
                            "Se Déconnecter",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        tileColor: Colors.green,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future EvaluerApp() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Evaluez l\'Application'),
            content: TextField(
              autofocus: true,
              decoration: InputDecoration(hintText: 'Saisir une Note'),
            ),
            actions: [
              TextButton(onPressed: resset, child: Text("Annuler")),
              TextButton(onPressed: submit, child: Text('Envoyer')),
            ],
          ));

  Future Apropos() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(
                'Notre application de gestion de budget est un outil qui vous permet  de suivre, de gérer et d\'analyser vos dépenses et vos revenus pour mieux gérer vos finances personnelles.'),
            actions: [
              TextButton(onPressed: resset, child: Text("Fermer")),
            ],
          ));
  void submit() {
    Navigator.of(context).pop();
  }

  void resset() {
    Navigator.pop(context);
  }
}
