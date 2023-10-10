import 'package:flutter/material.dart';

class EditUserProfil extends StatefulWidget {
  const EditUserProfil({super.key});

  @override
  State<EditUserProfil> createState() => _EditUserProfilState();
}

class _EditUserProfilState extends State<EditUserProfil> {
  bool isObscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Modifier mon Profil'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: (){},
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15,top: 20, right: 15),
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 150,
                        height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4,
                        color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1)
                          )
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage('https://www.pngall.com/wp-content/uploads/8/Young-Man-PNG-Free-Image.png',
                          )
                        )
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 4,
                                  color: Colors.white38),
                              color: Colors.green
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(height: 30,),
              buildTextField("Nom", "Fomba", false),
              buildTextField("Prénom", "Souleymane", false),
              buildTextField("Email", "azert@gmail.com", false),
              buildTextField("Mot de Pass", "********", true),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(onPressed: (){},
                      child:Text("Annuler", style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: Colors.black
                      )),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: EdgeInsets.symmetric(
                        horizontal: 50
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),)
                    ),
                  ),
                  ElevatedButton(onPressed: (){},
                      child: Text("Enregistrer", style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: Colors.white
                      )),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(
                        horizontal: 50
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),)
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget buildTextField(String labelText, String placeholder, bool isPasswordTextfield){
    return Padding(padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: isPasswordTextfield ? isObscurePassword: false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextfield ?
              IconButton(onPressed: () {},
                  icon: Icon(Icons.remove_red_eye, color: Colors.grey),
              ):null,
              contentPadding: EdgeInsets.only(bottom: 5),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeholder,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey
        )
        ),
      ),
    );
  }
}