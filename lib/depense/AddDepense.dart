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
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
              child: Form(
                key: _formkey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          keyboardType : TextInputType.number,
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
                              width: 24, // Ajustez la largeur de l'image
                              height: 24, // Ajustez la hauteur de l'image
                            ),
                            errorStyle: TextStyle(fontSize: 12.0),  // Adjust the error text font size
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(9.0)),
                            ),
                            contentPadding: EdgeInsets.all(10.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          style: TextStyle(fontSize: 14.0),
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: 'Enter email address'),
                            EmailValidator(
                                errorText:
                                'Please correct email filled'),
                          ]),
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            labelText: 'Entrez votre email',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Color(0xFF175419),
                            ),
                            errorStyle: TextStyle(fontSize: 12.0),  // Adjust the error text font size
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.all(Radius.circular(9.0)),
                            ),
                            contentPadding: EdgeInsets.all(10.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          style: TextStyle(fontSize: 14.0),
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: 'Enter email address'),
                            EmailValidator(
                                errorText:
                                'Please correct email filled'),
                          ]),
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            labelText: 'Entrez votre email',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Color(0xFF175419),
                            ),
                            errorStyle: TextStyle(fontSize: 12.0),  // Adjust the error text font size
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.all(Radius.circular(9.0)),
                            ),
                            contentPadding: EdgeInsets.all(10.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          style: TextStyle(fontSize: 14.0),
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: 'Enter email address'),
                            EmailValidator(
                                errorText:
                                'Please correct email filled'),
                          ]),
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            labelText: 'Entrez votre email',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Color(0xFF175419),
                            ),
                            errorStyle: TextStyle(fontSize: 12.0),  // Adjust the error text font size
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.all(Radius.circular(9.0)),
                            ),
                            contentPadding: EdgeInsets.all(10.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          style: TextStyle(fontSize: 14.0),
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: 'Enter email address'),
                            EmailValidator(
                                errorText:
                                'Please correct email filled'),
                          ]),
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            labelText: 'Entrez votre email',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Color(0xFF175419),
                            ),
                            errorStyle: TextStyle(fontSize: 12.0),  // Adjust the error text font size
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.all(Radius.circular(9.0)),
                            ),
                            contentPadding: EdgeInsets.all(10.0),
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