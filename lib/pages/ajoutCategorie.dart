import 'package:budgetflutter/model/categorie.dart';
import 'package:budgetflutter/services/categorieService.dart';
import 'package:flutter/material.dart';

class ajoutCategorie extends StatefulWidget {
  const ajoutCategorie({super.key});

  @override
  State<ajoutCategorie> createState() => _ajoutCategorieState();
}

class _ajoutCategorieState extends State<ajoutCategorie> {
  final TextEditingController _controller = TextEditingController();
  Future<Categorie>? futureCategorie;

  List image = [
    "assets/images/Alimentaire.png",
    "assets/images/iconLoyer.png",
    "assets/images/sport.png",
    "assets/images/loisir.png",
    "assets/images/transport.png",
    "assets/images/loisir.png",
    "assets/images/voyage.png",
    "assets/images/iconLoyer.png",
    "assets/images/Alimentaire.png",
    "assets/images/iconLoyer.png",
    "assets/images/sport.png",
    "assets/images/loisir.png",
    "assets/images/transport.png",
    "assets/images/loisir.png",
    "assets/images/voyage.png",
    "assets/images/iconLoyer.png",
    "assets/images/transport.png",
    "assets/images/loisir.png",
    "assets/images/voyage.png",
    "assets/images/iconLoyer.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Align(
            alignment: Alignment.center,
            child: Text(
              "Ajouter categorie",
              style: TextStyle(
                color: Color(0xFF175419),
                fontSize: 18,
                fontFamily: 'Poppins',
              ),
            )),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              child: Image.asset(
                "assets/images/cat.png",
                height: 120,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(25), //conteneur input ajout
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Entrer un categorie',
                ),
              ),
            ),
            Container(
              // logo
              child: Column(children: [
                GridView.builder(
                  itemCount: 16,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.only(top: 10),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            shape: BoxShape.circle,
                          ),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: (){
                                 
                                },
                                child: Image.asset(
                                image[index],
                                width: 150,
                              ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                )
              ]),
            ),
            Container(
              // button ajout
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                      0xFF175419), // Changer la couleur de fond du bouton
                  foregroundColor:
                      Colors.white, // Changer la couleur du texte du bouton
                  textStyle: const TextStyle(fontSize: 12),
                  padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      right: 60,
                      left: 60), // Changer la taille du texte du bouton
                ),
                onPressed: () {
                  setState(() {
                    futureCategorie =
                        CategorieService().creer(_controller.text);
                    _controller.text = "";
                  });
                },
                child: const Text(
                  'Choisir votre categorie',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
