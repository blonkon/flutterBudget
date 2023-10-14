import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

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
  String errormessage='';
  Categoriechoisie categoriechoisi = Categoriechoisie( id: 0,titre: 'Categorie');
  TextEditingController montantController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  Typechoisie typechoisie = Typechoisie(id: 1, titre: "Quotidien");
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
   void setstate(){
     setState(() {

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
          Container(
            padding: EdgeInsets.only(top:15),
            child: Text(errormessage,style: TextStyle(color: Colors.redAccent),),
          ), //le conteneur pour erreur
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
                          style: TextStyle(fontSize: 14.0,fontFamily: 'Poppins',color: Colors.grey),  // Adjust the font size here
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Montant Incorrect'),

                          ]),
                          decoration: InputDecoration(
                            filled: true, // Activez le remplissage du fond
                            fillColor:Color.fromRGBO(240, 241, 240, 1),
                            hintText: 'Montant',

                            prefixIcon: Image.asset(
                              'assets/momey.png', // Remplacez 'votre_image.png' par le chemin de votre image dans le dossier assets
                               // Ajustez la hauteur de l'image
                            ),
                            errorStyle: TextStyle(fontSize: 12.0),  // Adjust the error text font size
                             // Texte de l'étiquette

                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.redAccent, // Couleur de la bordure après une erreur en focus
                                width: 2.0, // Largeur de la bordure après une erreur en focus
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: mycolors, // Couleur de la bordure après une erreur en focus
                                width: 2.0, // Largeur de la bordure après une erreur en focus
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: mycolors, // Couleur de la bordure après une erreur en focus
                                width: 2.0, // Largeur de la bordure après une erreur en focus
                              ),
                            ),
                              enabledBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(218, 218, 218, 1), // Couleur de la bordure après une erreur en focus
                                  width: 2.0, // Largeur de la bordure après une erreur en focus
                                ),
                              ),
                            contentPadding: EdgeInsets.all(16),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                       showDialog(context: context, builder: (context)=> CustomOverlay(categoriechoisie: this.categoriechoisi,
                         onCategorySelected: (categoriechoisie) {
                           setState(() {
                             this.categoriechoisi = categoriechoisie;
                           });
                         },
                       ));

                          // Afficher une boîte de dialogue lorsque l'utilisateur clique sur le champ
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8) ,
                          child: TextFormField(
                            style: TextStyle(fontSize: 14.0,fontFamily: 'Poppins',color: Colors.black54),
                            enabled: false, // Désactiver la saisie
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(218, 218, 218, 1), // Couleur de la bordure après une erreur en focus
                                  width: 2.0, // Largeur de la bordure après une erreur en focus
                                ),
                              ),

                              filled: true,
                              hintText: categoriechoisi.titre,
                              fillColor: Color.fromRGBO(240, 241, 240, 1),
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
                                titlePadding: EdgeInsets.zero,
                                backgroundColor: Color.fromRGBO(217, 217, 217, 1),
                                title: Column(
                                  children: [
                                    Container(
                                      height: 46,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                                        color:  Color.fromRGBO(23, 84, 25, 1.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(),
                                          Container(),
                                          Container(
                                            child: Text("Type",style: TextStyle(fontFamily: 'Poppins',fontSize: 18,color: Colors.white, fontWeight : FontWeight.w100,decoration: TextDecoration.none),),
                                          ),
                                          Align(
                                            alignment: Alignment(1.0, 0),
                                            child:     TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop(); // Ferme la boîte de dialogue
                                              },
                                              child: Icon(Icons.cancel,color :Colors.white,),
                                            ),
                                          ),


                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                actionsPadding: EdgeInsets.zero,
                                actions: [
                                  Container(
                                    color : Color.fromRGBO(240, 241, 240, 1) ,
                                    child: ListTile(
                                      leading: Image.asset("assets/quotidien.png"), // icône à gauche
                                      title: Text('Quotidien'),
                                      onTap: () {
                                        this.typechoisie.id=1;
                                        this.typechoisie.titre="Quotidien";
                                        setState(() {
                                        });
                                        Navigator.of(context).pop();
                                        // Action à effectuer lorsque l'utilisateur appuie sur le ListTile
                                      },
                                    ) ,
                                  ),
                                  Container(
                                    height: 20,
                                  ),
                                  Container(
                                    color : Color.fromRGBO(240, 241, 240, 1) ,
                                    child: ListTile(
                                      leading: Image.asset("assets/hebdomadaire.png"), // icône à gauche
                                      title: Text('Hebdomadaire'),
                                      onTap: () {
                                        this.typechoisie.id=2;
                                        this.typechoisie.titre="Hebdomadaire";
                                        setState(() {
                                        });
                                        Navigator.of(context).pop();
                                        // Action à effectuer lorsque l'utilisateur appuie sur le ListTile
                                      },
                                    ) ,
                                  ),
                                  Container(
                                    height: 20,
                                  ),
                                  Container(
                                    color : Color.fromRGBO(240, 241, 240, 1) ,
                                    child: ListTile(
                                      leading: Image.asset("assets/mensuel.png"), // icône à gauche
                                      title: Text('Mensuel'),
                                      onTap: () {
                                        this.typechoisie.id=3;
                                        this.typechoisie.titre="Mensuel";
                                        setState(() {
                                        });
                                        Navigator.of(context).pop();
                                        // Action à effectuer lorsque l'utilisateur appuie sur le ListTile
                                      },
                                    ) ,
                                  ),
                                  Container(
                                    height: 20,
                                  ),
                                ],

                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8) ,
                          child: TextFormField(
                            style: TextStyle(fontSize: 14.0,fontFamily: 'Poppins',color: Colors.black54),
                            enabled: false, // Désactiver la saisie
                            decoration: InputDecoration(

                              contentPadding: EdgeInsets.zero,
                              filled: true,
                              hintText: this.typechoisie.titre,
                              fillColor: Color.fromRGBO(240, 241, 240, 1),
                              prefixIcon: Image.asset("assets/type.png"),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(218, 218, 218, 1), // Couleur de la bordure après une erreur en focus
                                    width: 2.0, // Largeur de la bordure après une erreur en focus
                                  ),
                                ),
                              suffixIcon: Padding(
                                padding: EdgeInsets.zero,
                                child: Image.asset("assets/button.png"),
                              ) // Vous pouvez personnaliser l'icône d'édition
                            ),
                          ),

                        ),
                      ),
                      GestureDetector(
                        onTap: _showdate,
                        child: Padding(
                          padding: const EdgeInsets.all(8) ,
                          child: TextFormField(
                            style: TextStyle(fontSize: 14.0,fontFamily: 'Poppins',color: Colors.black54),
                            enabled: false, // Désactiver la saisie
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(16),
                             disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(218, 218, 218, 1), // Couleur de la bordure après une erreur en focus
                                  width: 2.0, // Largeur de la bordure après une erreur en focus
                                ),
                              ),
                              filled: true,
                              hintText: "${this.date.day}/${this.date.month}/${this.date.year}",
                              fillColor: Color.fromRGBO(240, 241, 240, 1),
                              prefixIcon: Image.asset("assets/date.png"),
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
                          style: TextStyle(fontSize: 14.0,fontFamily: 'Poppins',color: Colors.grey),  // Adjust the font size here// Adjust the font size here
                          decoration: InputDecoration(
                            hintText: "Description",
                            filled: true, // Activez le remplissage du fond
                            fillColor: Color.fromRGBO(240, 241, 240, 1),


                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(

                                color: mycolors, // Couleur de la bordure après une erreur en focus
                                width: 2.0, // Largeur de la bordure après une erreur en focus
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              // Bordure lorsqu'elle est en focus
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: mycolors, // Couleur de la bordure en focus
                                width: 2.0, // Largeur de la bordure en focus
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              // Bordure en dehors du focus
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(23, 84, 25, 1.0), // Couleur de la bordure en dehors du focus
                                width: 1.0, // Largeur de la bordure en dehors du focus
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

              padding: EdgeInsets.only(bottom: 16.0),
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  minimumSize: MaterialStateProperty.all<Size>(Size(160, 56)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(23, 84, 25, 1.0)),
                ),
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    montantmodel.Types.forEach((element) {
                      if(element.titre.toUpperCase()==this.typechoisie.titre.toUpperCase()){
                       this.typechoisie.id=element.id;
                      }
                    });
                    String description;
                   if(descriptionController.text.isEmpty){
                     description="Non indiquer";
                   }else{
                     description=descriptionController.text;
                   }
                    int? montantenEntier = int.tryParse(montantController.text);
                    if(this.categoriechoisi.id!=0){
                      if (montantenEntier != null ) {
                        if( montantenEntier > 0){
                          if(montantmodel.Categoriesolde_restant>=montantenEntier){
                            this.errormessage="";
                            final depense = DepenseData(
                              description: description,
                              montant: montantenEntier,
                              date: "${date.year}-${date.month}-${date.day}",
                              utilisateur: {"idUtilisateur": montantmodel.USER_ID},
                              budget: {"idBudget": this.categoriechoisi.id},
                              type: {"idType": this.typechoisie.id},
                            );
                            final response = await http.post(
                              Uri.parse("http://10.0.2.2:8080/Depenses/create"),
                              headers: {
                                'Content-Type': 'application/json'
                              },
                              body: jsonEncode(depense.toJson()),
                            );

                            if (response.statusCode == 200) {
                              // La requête a réussi, vous pouvez traiter la réponse si nécessaire
                              print('Réponse de l\'API : ${response.body}');
                              montantmodel.fetchAlbum();
                              montantmodel.Trieurmontant(0);
                              Navigator.pop(context);

                            } else {
                              // La requête a échoué
                              errormessage=jsonDecode(utf8.decode(response.bodyBytes))["message"];
                              print('Erreur de la requête : ${response.statusCode}');
                              print('Message derreur : ${response.body}');
                              }
                            setState(() {

                            });
                          }else{
                            this.errormessage="Montant trop grand";
                            setState(() {

                            });
                          }
                        }else{
                          this.errormessage="Montant trop  petit";
                          setState(() {

                          });
                        }
                      } else {
                        this.errormessage="Montant invalide";
                        setState(() {

                        });
                      }
                    }else {
                      this.errormessage="Choississez une Categorie";
                      setState(() {

                      });
                    }


                    print(montantController.text+' \n'+this.categoriechoisi.titre+'\n'+this.typechoisie.id.toString()+' \n'+this.date.toString()+' \n'+descriptionController.text);
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
class Typechoisie {
  int id;
  String titre;
  Typechoisie({required this.id,required this.titre});
}

class CustomOverlay extends StatelessWidget {
  final Categoriechoisie categoriechoisie;
  final Function(Categoriechoisie) onCategorySelected;
  CustomOverlay({required this.categoriechoisie,required this.onCategorySelected });

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
                color: Color.fromRGBO(217, 217, 217, 1),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                      color:  Color.fromRGBO(23, 84, 25, 1.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(),
                        Container(),
                        Container(
                          child: Text("Categories",style: TextStyle(fontFamily: 'Poppins',fontSize: 18,color: Colors.white, fontWeight : FontWeight.w100,decoration: TextDecoration.none),),
                        ),
                        Align(
                            alignment: Alignment(1.0, 0),
                            child:     TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Ferme la boîte de dialogue
                              },
                              child: Icon(Icons.cancel,color :Colors.white,),
                            ),
                          ),


                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Expanded(
                      child: GridView.builder(
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
                              this.categoriechoisie.id=categorie.idbudget;
                              this.categoriechoisie.titre=categorie.titre;
                              // Action à effectuer lorsque la catégorie est cliquée
                              montantModel.categoriesolde(categorie.id);
                              print(this.categoriechoisie.id.toString());
                              onCategorySelected(this.categoriechoisie);
                              Navigator.pop(context);
                              // Code pour effectuer des modifications d'état ici


                          },
                          child: Column(
                            children: [
                              Container(
                                width: 64, // Largeur du cercle
                                height: 64, // Hauteur du cercle
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle, // Forme de cercle
                                  color: Colors.white, // Couleur de fond du cercle
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Image.asset("assets/"+categorie.img,width: 48,height: 48,),
                                  ),
                                ),
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
class DepenseData {
  final String description;
  final int montant;
  final String date;
  final Map<String, int> utilisateur;
  final Map<String, int> budget;
  final Map<String, int> type;

  DepenseData({
    required this.description,
    required this.montant,
    required this.date,
    required this.utilisateur,
    required this.budget,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'montant': montant,
      'date': date,
      'utilisateur': utilisateur,
      'budget': budget,
      'type': type,
    };
  }
}