import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../pages/ajout_budget.dart';
import 'MontantModel.dart';

class Liste_depense extends StatelessWidget{

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
            padding: EdgeInsets.only(top: 40,left: 15,right: 15,bottom: 20),
            child:ListView.builder(
                padding: EdgeInsets.only(bottom: 12),

                itemCount: context.watch<MontantModel>().CategorieTrie.length,
                itemBuilder: (BuildContext context, int index) {
                  final montantmodel = context.read<MontantModel>();
                  final Depens = montantmodel.CategorieTrie[index];
                  return CustomCard(depense: Depens,img:montantmodel.imgforlist);
                }
                )
              )
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
            child: Text('${Montant.montantcat}'+ "fcfa",
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




class CustomCard extends StatelessWidget {
  final Depense depense;
  final String img;
  CustomCard({required this.depense,required this.img});

  @override
  Widget build(BuildContext context) {
    return Card(
          elevation: 5,
      color: Color.fromRGBO(243, 243, 243, 1),
      child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                height: 52,
                width: 52,
                child: Image.asset('assets/'+img),
              )
          // Première colonne avec une image (vous pouvez garder cette partie)
              ,

          // Deuxième colonne contenant le texte (utilisez les données du budget)
              Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 12),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          depense.montant.toString()+" Fcfa",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            '${depense.date.day}'+'/'+'${depense.date.month}'+'/'+'${depense.date.year}', style: TextStyle(fontSize: 12.0, color: Color.fromRGBO(83, 87, 83, 1.0),fontFamily: 'Poppins'),),

                        ),

                            ],
                    ),
                  )

              ),

          // Troisième colonne avec le bouton d'options (les trois points verticaux)
            PopupMenuButton<String>(
              itemBuilder: (context) {return [
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

//context
//                   .watch<MontantModel>()
//                   .Categories
//                   .map(
//                     (categorie) => Categoriee(cat: categorie)
//               )