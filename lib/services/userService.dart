import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class userService {
  //create the method to save user

  Future<http.Response> saveUser(
      String nom_prenom, String email, String password) async {
    //create uri
    var uri = Uri.parse("http://10.0.2.2:8080/utilisateur/create");
    //header
    Map<String, String> headers = {"Content-Type": "application/json"};

    //body
    Map data = {
      'nom_prenom': '$nom_prenom',
      'email': '$email',
      'motDePasse': '$password',
    };
    //convert the above data into json
    var body = json.encode(data);
    print(body);
    var response = await http.post(uri, headers: headers, body: body);

    //print the response body
    print("${response.body}");

    return response;
  }
  Future<void> loginUser(String email, String password) async {
    final apiUrl = 'http://10.0.2.2:8080/utilisateur/login';

    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'email': email,
        'motDePasse': password,
      },
    );

    if (response.statusCode == 200) {
      // Connexion réussie
      print('Connexion réussie');
    } else {
      // Identifiants invalides
      print('Identifiants invalides');
    }
  }

}


