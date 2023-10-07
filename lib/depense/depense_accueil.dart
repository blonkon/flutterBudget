import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'MontantModel.dart';

class depense_accueil extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading : IconButton(
        icon: Icon(Icons.arrow_circle_left_outlined,
        size: 32,
        color: Color.fromRGBO(23, 84, 25, 1.0),),
        onPressed: () {  },
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
        body:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(right: 24.0),
              child : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 30),
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
              padding: EdgeInsets.only(top: 30),
                child: Image.asset("assets/pocket2.png")
            ),
            Container(
              padding: EdgeInsets.only(top:30),
              child: Text("Test"),
            ),

          ],
        )
      );
  
  }

}

class Total extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MontantModel>(
        builder: (context, Montant, child) {
       return Container(
      padding: EdgeInsets.only(top: 30),
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
