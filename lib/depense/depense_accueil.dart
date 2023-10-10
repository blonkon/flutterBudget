import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'MontantModel.dart';

class depense_accueil extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading : IconButton(
        icon: Icon(Icons.arrow_circle_left_outlined,
        size: 32,
        color: Color.fromRGBO(23, 84, 25, 1.0),),
        onPressed: () {

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
        body:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                Expanded(child: Container(
                  padding: EdgeInsets.only(top: 40,left: 25,right: 25,bottom: 20),
                  child:
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 25.0,
                      crossAxisCount: 2, // Nombre de colonnes
                      mainAxisSpacing: 20.0, // Espacement vertical entre les éléments
                    ),

                    itemCount: context.watch<MontantModel>().Categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      final categorie = context.watch<MontantModel>().Categories[index];

                      return GestureDetector(
                        onTap: () {
                          // Action à effectuer lorsque la catégorie est cliquée
                        },
                        child:Categoriee(cat: categorie) ,
                      );
                    },
                  ) ,

                ),
                ),
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
                      onPressed: () {},
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
      child: Text('${Montant.montant}'+ "fcfa",
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
class Categoriee extends StatelessWidget{
  final Categorie cat;
  Categoriee({required this.cat});
  @override
  Widget build(BuildContext context) {
    return
        Card(
        elevation: 5,
        surfaceTintColor: Color.fromRGBO(56, 58, 56, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 5),
              child:
              Image.asset("assets/"+cat.img),
            ), // Utilisation de l'image du modèle
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(cat.titre),
            )
          ],
        ),
    );



  }

}



//context
//                   .watch<MontantModel>()
//                   .Categories
//                   .map(
//                     (categorie) => Categoriee(cat: categorie)
//               )