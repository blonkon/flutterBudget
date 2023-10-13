import 'package:budgetflutter/pages/InscriptionPage.dart';
import 'package:budgetflutter/pages/accueil.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../services/userService.dart';

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({Key? key}) : super(key: key);

  @override
  State<ConnexionPage> createState() => _LoginState();
}

class _LoginState extends State<ConnexionPage> {
  Map userData = {};
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  userService Service = userService();
  Color mycolors = Color(0xFF175419);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Connexion',
          style: TextStyle(
            color: mycolors,
            fontSize: 30,
            fontWeight: FontWeight.bold, // Change the color here
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Center(
                child: Container(
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Colors.grey),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formkey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width:
                                  350, // Adjust the width of the container here
                              height:
                                  50, // Adjust the height of the container here
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                style: TextStyle(fontSize: 14.0),
                                controller: _emailController,
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: 'Enter email address'),
                                  EmailValidator(
                                      errorText: 'Please correct email filled'),
                                ]),
                                decoration: const InputDecoration(
                                  hintText: 'Email',
                                  labelText: 'Entrez votre email',
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Color(0xFF175419),
                                  ),
                                  errorStyle: TextStyle(
                                      fontSize:
                                          12.0), // Adjust the error text font size
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(9.0)),
                                  ),
                                  contentPadding: EdgeInsets.all(10.0),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width:
                                  350, // Adjust the width of the container here
                              height:
                                  50, // Adjust the height of the container here
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                controller: _passwordController,
                                style: TextStyle(fontSize: 14.0),
                                // validator: MultiValidator([
                                //  RequiredValidator(
                                //    errorText: 'Desolé entrez votre mots de passe'),
                                // MinLengthValidator(8,
                                //   errorText:
                                // 'le mots de passe doit contenir au moins 8 caracteres'),
                                // PatternValidator(r'(?=.*?[#!@$%^&*-])',
                                //   errorText:
                                // 'le mots de passe doit contenir au moins un caractere')
                                //]),
                                decoration: const InputDecoration(
                                  hintText: 'Mots de passe',
                                  labelText: 'Entrez votre mots de passe',
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Color(0xFF175419),
                                  ),
                                  errorStyle: TextStyle(
                                      fontSize:
                                          12.0), // Adjust the error text font size
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(9.0)),
                                  ),
                                  contentPadding: EdgeInsets.all(10.0),
                                ),
                              ),
                            ),
                          ),
                          //Container(
                          //margin: const EdgeInsets.fromLTRB(180, 0, 0, 0),
                          //child: const Text('Forget Password!'),
                          //),

                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      mycolors, // Couleur de fond du bouton
                                  onPrimary: Colors
                                      .white, // Couleur du texte du bouton
                                ),
                                  onPressed: () async {
                                        try {
                                          // Appeler la méthode loginUser du service
                                          await Service.loginUser(_emailController.text, _passwordController.text);

                                          // Effacer les champs de texte
                                          // _emailController.clear();
                                          // _passwordController.clear();

                                          // Naviguer vers la page d'accueil
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => accueil()),
                                          );
                                        } catch (e) {
                                          // Gérer les erreurs de connexion
                                          print('Erreur de connexion : $e');
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text('Erreur de connexion. Veuillez réessayer.')),
                                          );
                                        }
                                      },
                                // onPressed: () {
                                //   Service.loginUser(_emailController.text,
                                //       _passwordController.text);
                                //   _emailController.clear();
                                //   _passwordController.clear();
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => accueil()),
                                //   );
                                // },
                                child: const Text(
                                  'Se connectez',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ),
                            ),
                          ),
                        ]),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    height: 10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Se connectez avec !',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: mycolors,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    height: 10,
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 30, left: 90),
                child: Row(
                  children: [
                    Container(
                        width: 70,
                        height: 50,
                        margin: EdgeInsets.only(right: 10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey)),
                        child: Image.asset(
                          'assets/images/google.png',
                          fit: BoxFit.cover,
                        )),
                    Container(
                      width: 70,
                      height: 50,
                      margin: EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey)),
                      child: Image.asset(
                        'assets/images/facebook.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: 70,
                      height: 50,
                      margin: EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey)),
                      child: Image.asset(
                        'assets/images/linked.png',
                        //fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: RichText(
                  text: TextSpan(
                    // style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: 'Vous n avez pas de  compte ? ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                        ),
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const InscriptionPage()));
                          },
                        text: 'Inscrivez vous',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
