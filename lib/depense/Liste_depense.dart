import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../pages/ajout_budget.dart';
import 'AddDepense.dart';
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddDepense()),
                  );
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
            child: Text('${Montant.formatMontant(Montant.montantcat) } ',
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
              elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              itemBuilder: (context) {return [
                PopupMenuItem<String>(
                  height: 10,
                  value: 'close', // Élément spécial pour fermer le menu
                  child: Align(
                    alignment: Alignment(1.0, 0),
                    child: Icon(Icons.cancel,color :Color.fromRGBO(23, 84, 25, 1.0),),
                  ), // Vous pouvez utiliser une icône à la place
                ),
                PopupMenuItem(
                  height: 10,
                value: 'detail',
                  child: Row(
                    children: [
                      Icon(IconData(0xf424, fontFamily: CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage),color :Color.fromRGBO(23, 84, 25, 1.0),),
                      SizedBox(width: 8.0),
                      Text('Détails',style:TextStyle(color :Color.fromRGBO(23, 84, 25, 1.0),),),
                ],
                ),
              ),
                PopupMenuItem(
                  value: 'modifier',
                  child: Row(
                    children: [
                    Icon(Icons.edit,color :Color.fromRGBO(23, 84, 25, 1.0),),
                    SizedBox(width: 8.0),
                    Text('Modifier',style: TextStyle(color :Color.fromRGBO(23, 84, 25, 1.0),),),
          ],
          ),
          ),
                PopupMenuItem(
                  height: 10,
                  value: 'supprimer',
                  child: Row(
                  children: [
                    Icon(Icons.delete,color: Colors.red,),
                      SizedBox(width: 8.0),
                      Text('Supprimer',style: TextStyle(color: Colors.red),),

          ],
          ),
          ),

          ];
          },
          onSelected: (value) {
          // Code à exécuter en fonction de l'option sélectionnée
          if (value == 'detail') {

            showDialog(
              context: context,

              // Le contexte du widget parent
              builder: (BuildContext context) {

                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  title: Align(
                    alignment: Alignment(1.0, 0),
                    child:     TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Ferme la boîte de dialogue
                      },
                      child: Icon(Icons.cancel,color :Color.fromRGBO(23, 84, 25, 1.0),),
                    ),
                  ),
                  titlePadding: EdgeInsetsDirectional.only(end: 0,bottom: 0.2),
                  content: Container(
                    child:Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Text("Montant : " ,style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.bold ),),
                            Text(" ${depense.montant} fcfa",style: TextStyle(fontFamily: 'Poppins',color :Color.fromRGBO(23, 84, 25, 1.0)),)
                          ],
                        ),
                        Row(
                          children: [
                            Text("Description : " ,style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.bold ),),
                          ],
                        ),
                        Row(
                          children: [
                            Text("${depense.description}",style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.normal))
                          ],
                        ),
                        Row(
                          children: [
                            Text("Date : " ,style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.bold ),),
                            Text(" ${depense.date.day}/${depense.date.month}/${depense.date.year} ",style: TextStyle(fontFamily: 'Poppins'),)
                          ],
                        )
                      ],
                    )
                  ),



                );
              },
            );
          // Action de détail
          } else if (value == 'modifier') {
          // Action de modification
          } else if (value == 'supprimer') {
            showDialog(
              context: context,

              // Le contexte du widget parent
              builder: (BuildContext context) {

                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  title: Align(
                    alignment: Alignment(1.0, 0),
                    child:     TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Ferme la boîte de dialogue
                      },
                      child: Icon(Icons.cancel,color :Color.fromRGBO(23, 84, 25, 1.0),),
                    ),
                  ),
                  titlePadding: EdgeInsetsDirectional.only(end: 0,bottom: 0.2),
                  content: Align(
                      heightFactor: 0.5,
                    alignment: Alignment.center,
                      child: Text("Voulez-vous spprimer ?" ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
                  ),
                  actions: [
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              minimumSize: MaterialStateProperty.all<Size>(Size(32, 32)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(23, 84, 25, 1.0)),
                            ),
                            onPressed: () async {

                              final montantmodel = context.read<MontantModel>();
                              await montantmodel.deleted(depense);
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Oui',
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 16.0),
                          TextButton(

                            style: ButtonStyle(

                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              minimumSize: MaterialStateProperty.all<Size>(Size(32, 32)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(206, 114, 13, 1.0)),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Non',
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                        ,

                    )


                  ],



                );
              },
            );
          // Action de suppression
          }
          else if(value == 'fermer'){

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