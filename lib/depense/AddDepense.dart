import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  DateTime date = DateTime.now();
  Categoriechoisie categoriechoisi = Categoriechoisie( id: 0,titre: 'Categorie');
  TextEditingController montantController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  Color mycolors = Color(0xFF175419);
  // fonction de date picker
   void _showdate(){
        showDatePicker(

            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(DateTime.now().year,DateTime.now().month),
            lastDate: DateTime(DateTime.now().year,DateTime.now().month+1,0),
            locale: const Locale('fr', 'FR'),
            builder: (BuildContext context, Widget? child) {
            return Theme(
              data: ThemeData.light().copyWith(
                primaryColorLight: Color.fromRGBO(23, 85, 25, 1),
                colorScheme: ColorScheme.light(
                  // Couleur de fond du jour sélectionné
                  primary: Color.fromRGBO(23, 85, 25, 1),
                ),
              ),
              child: child!,
            );
          },
        ).then((value) {
          setState(() {
            date = value!;
          });
        });
   }
  @override
  Widget build(BuildContext context) {
    final montantmodel = context.read<MontantModel>();
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
                          controller: montantController,
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
                       showDialog(context: context, builder: (context)=> CustomOverlay(categoriechoisie: this.categoriechoisi,));

                          // Afficher une boîte de dialogue lorsque l'utilisateur clique sur le champ
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8) ,
                          child: TextFormField(
                            enabled: false, // Désactiver la saisie
                            decoration: InputDecoration(
                              filled: true,
                              hintText: categoriechoisi.titre,
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
                      GestureDetector(
                        onTap: _showdate,
                        child: Padding(
                          padding: const EdgeInsets.all(8) ,
                          child: TextFormField(
                            enabled: false, // Désactiver la saisie
                            decoration: InputDecoration(
                              filled: true,
                              hintText: "${this.date.day}/${this.date.month}/${this.date.year}",
                              fillColor: Colors.grey,
                              prefixIcon: Image.asset("assets/date.png"),
                              border: InputBorder.none,
                            ),
                          ),

                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: descriptionController,
                          maxLines: 5,
                          maxLength: 150,
                          cursorColor: mycolors,
                          style: TextStyle(fontSize: 14.0),  // Adjust the font size here
                          decoration: InputDecoration(
                            hintText: "Description",
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
                            contentPadding: EdgeInsets.only(top:15,left: 15),
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
                    print(montantController.text+descriptionController.text+this.date.toString());
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
class Categoriechoisie {
   int id;
   String titre;
   Categoriechoisie({required this.id,required this.titre});
}

class CustomOverlay extends StatelessWidget {
  final Categoriechoisie categoriechoisie;
  CustomOverlay({required this.categoriechoisie});

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
          ),
        ),
        // Contenu au milieu
        Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Container(

              width: double.maxFinite, // Largeur de la boîte de dialogue
              height: 300, // Hauteur de la boîte de dialogue
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment(1.0, 0),
                    child:     TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Ferme la boîte de dialogue
                      },
                      child: Icon(Icons.cancel,color :Color.fromRGBO(23, 84, 25, 1.0),),
                    ),
                  ),
                  Expanded(child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                      crossAxisCount: 3, // Nombre de colonnes
                       // Espacement vertical entre les éléments
                    ),
                    itemCount: Provider.of<MontantModel>(context, listen: false).Categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      final categorie = Provider.of<MontantModel>(context, listen: false).Categories[index];
                      return GestureDetector(
                          onTap: () {
                            final montantModel = Provider.of<MontantModel>(context, listen: false);
                            montantModel.imgforliste = categorie.img;
                            montantModel.Trieurmontant(categorie.id);
                            this.categoriechoisie.id=categorie.id;
                            this.categoriechoisie.titre=categorie.titre;
                            // Action à effectuer lorsque la catégorie est cliquée
                            Navigator.pop(context);
                          },
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 12),
                                width: 56, // Largeur du cercle
                                height: 56, // Hauteur du cercle
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle, // Forme de cercle
                                  color: Colors.white, // Couleur de fond du cercle
                                ),
                                child: Image.asset("assets/"+categorie.img),
                                // Autres enfants à l'intérieur du cercle, si nécessaire
                              ),

                              Container(
                                padding : EdgeInsets.only(right: 5),
                                child: Text(categorie.titre,style: TextStyle(color: Color.fromRGBO(23, 84, 25, 1.0),fontSize: 12,fontFamily: 'Poppins',fontWeight : FontWeight.w200,decoration: TextDecoration.none),),

                              )
                            ],
                          )
                      );
                    },
                  ))
                  // Votre grille ici
                  ,
                  // Bouton pour fermer la boîte de dialogue

                ],
              ),
            ),
          )
        ),
      ],
    );
  }
}