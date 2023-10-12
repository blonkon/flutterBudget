import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import 'MontantModel.dart';

class AddDepense extends StatefulWidget {
  const AddDepense({Key? key}) : super(key: key);


  @override
  State<AddDepense> createState() => _LoginState();
}

class _LoginState extends State<AddDepense> {
  Map userData = {};
  final _formkey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  Color mycolors = Color(0xFF175419);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading : IconButton(
          icon: Icon(Icons.arrow_circle_left_outlined,
            size: 32,
            color: Color.fromRGBO(23, 84, 25, 1.0),),
          onPressed: () {
            final montantmodel = context.read<MontantModel>();
            montantmodel.Categoriesolde_restant=0;
            Navigator.pop(context);
          },
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 24.0),
            child: Text("Depenses",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(23, 84, 25, 1.0),)
            ),
          )],
      ),
      body: SingleChildScrollView(
      child:  Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 24.0),
            child : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Text("Total ",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ) ,
                    )),
                Total()
              ],
            ),
          ),
          Container(
              height: 100,
              width: 100,
              padding: EdgeInsets.only(top: 15),
              child: Image.asset("assets/pocket2.png")
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Form(
                key: _formkey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType : TextInputType.number,
                          cursorColor: mycolors,
                          style: TextStyle(fontSize: 14.0),  // Adjust the font size here
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Montant Incorrect'),

                          ]),
                          decoration: InputDecoration(
                            filled: true, // Activez le remplissage du fond
                            fillColor: Colors.grey,
                            hintText: 'Montant',
                            labelText: 'Montant',
                            prefixIcon: Image.asset(
                              'assets/momey.png', // Remplacez 'votre_image.png' par le chemin de votre image dans le dossier assets
                               // Ajustez la hauteur de l'image
                            ),
                            errorStyle: TextStyle(fontSize: 12.0),  // Adjust the error text font size
                             // Texte de l'étiquette

                            errorBorder: OutlineInputBorder(
                               // Définir la forme des coins
                              borderSide: BorderSide(
                                color: Colors.white, // Couleur de la bordure d'erreur
                                width: 2.0, // Largeur de la bordure d'erreur
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(

                              borderSide: BorderSide(
                                color: mycolors, // Couleur de la bordure après une erreur en focus
                                width: 2.0, // Largeur de la bordure après une erreur en focus
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                // Bordure lorsqu'elle est en focus

                                borderSide: BorderSide(
                                  color: mycolors, // Couleur de la bordure en focus
                                  width: 2.0, // Largeur de la bordure en focus
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                // Bordure en dehors du focus

                                borderSide: BorderSide(
                                  color: Colors.white, // Couleur de la bordure en dehors du focus
                                  width: 2.0, // Largeur de la bordure en dehors du focus
                                ),
                              ),
                            contentPadding: EdgeInsets.all(22),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Afficher une boîte de dialogue lorsque l'utilisateur clique sur le champ
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Modifier la valeur'),
                                content: Text('Contenu de la boîte de dialogue'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(); // Fermer la boîte de dialogue
                                    },
                                    child: Text('Fermer'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8) ,
                          child: TextFormField(
                            enabled: false, // Désactiver la saisie
                            decoration: InputDecoration(
                              filled: true,
                              hintText: "Categories",
                              fillColor: Colors.grey,
                              prefixIcon: Image.asset("assets/categoriefordepense.png"),
                              border: InputBorder.none,
                              suffixIcon: Image.asset("assets/button.png"), // Vous pouvez personnaliser l'icône d'édition
                            ),
                          ),

                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Afficher une boîte de dialogue lorsque l'utilisateur clique sur le champ
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Modifier la valeur'),
                                content: Text('Contenu de la boîte type'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(); // Fermer la boîte de dialogue
                                    },
                                    child: Text('Fermer'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8) ,
                          child: TextFormField(
                            enabled: false, // Désactiver la saisie
                            decoration: InputDecoration(
                              filled: true,
                              hintText: "Types",
                              fillColor: Colors.grey,
                              prefixIcon: Image.asset("assets/type.png"),
                              border: InputBorder.none,
                              suffixIcon: Image.asset("assets/button.png"), // Vous pouvez personnaliser l'icône d'édition
                            ),
                          ),

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType : TextInputType.number,
                          cursorColor: mycolors,
                          style: TextStyle(fontSize: 14.0),  // Adjust the font size here
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Date Incorrect'),

                          ]),
                          decoration: InputDecoration(
                            filled: true, // Activez le remplissage du fond
                            fillColor: Colors.grey,
                            hintText: 'Date',
                            labelText: 'Date',
                            prefixIcon: Image.asset(
                              'assets/date.png', // Remplacez 'votre_image.png' par le chemin de votre image dans le dossier assets
                              // Ajustez la hauteur de l'image
                            ),
                            errorStyle: TextStyle(fontSize: 12.0),  // Adjust the error text font size
                            // Texte de l'étiquette

                            errorBorder: OutlineInputBorder(
                              // Définir la forme des coins
                              borderSide: BorderSide(
                                color: Colors.white, // Couleur de la bordure d'erreur
                                width: 2.0, // Largeur de la bordure d'erreur
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(

                              borderSide: BorderSide(
                                color: mycolors, // Couleur de la bordure après une erreur en focus
                                width: 2.0, // Largeur de la bordure après une erreur en focus
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              // Bordure lorsqu'elle est en focus

                              borderSide: BorderSide(
                                color: mycolors, // Couleur de la bordure en focus
                                width: 2.0, // Largeur de la bordure en focus
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              // Bordure en dehors du focus

                              borderSide: BorderSide(
                                color: Colors.white, // Couleur de la bordure en dehors du focus
                                width: 2.0, // Largeur de la bordure en dehors du focus
                              ),
                            ),
                            contentPadding: EdgeInsets.all(22),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.9, 0),
                        child: Text("Description",style: TextStyle(color: mycolors),),
                      )
                      ,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          cursorColor: mycolors,
                          style: TextStyle(fontSize: 14.0),  // Adjust the font size here
                          decoration: InputDecoration(
                            filled: true, // Activez le remplissage du fond
                            fillColor: Colors.grey,

                            focusedErrorBorder: OutlineInputBorder(

                              borderSide: BorderSide(
                                color: mycolors, // Couleur de la bordure après une erreur en focus
                                width: 2.0, // Largeur de la bordure après une erreur en focus
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              // Bordure lorsqu'elle est en focus

                              borderSide: BorderSide(
                                color: mycolors, // Couleur de la bordure en focus
                                width: 2.0, // Largeur de la bordure en focus
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              // Bordure en dehors du focus

                              borderSide: BorderSide(
                                color: Colors.white, // Couleur de la bordure en dehors du focus
                                width: 2.0, // Largeur de la bordure en dehors du focus
                              ),
                            ),
                            contentPadding: EdgeInsets.only(top :2,bottom: 100),
                          ),
                        ),
                      ),
                    ]),
              )
          )
          ,
          Align(

            alignment: Alignment.bottomCenter,
            child: Container(

              padding: EdgeInsets.only(top: 6.0,bottom: 16.0),
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  minimumSize: MaterialStateProperty.all<Size>(Size(160, 56)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(23, 84, 25, 1.0)),
                ),
                onPressed: () {
                  final montantmodel = context.read<MontantModel>();
                  montantmodel.categoriesolde(1);
                  if (_formkey.currentState!.validate()) {
                    print('form submiitted');
                  }

                },
                child: Text(
                  'Depenser',
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      )    ,

      );

  }

}
class Total extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MontantModel>(
        builder: (context, Montant, child) {
          return Container(
            padding: EdgeInsets.only(top: 15),
            child: Text('${Montant.formatMontant(Montant.Categoriesolde_restant)} ',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24,
              ),
            ),
          );
        }
    );
  }
}