import 'dart:convert';

import 'package:budgetflutter/model/profile.dart';
import 'package:http/http.dart' as http;

class profilService {

Future<User> fetchUser() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8080/utilisateur/read/:id'));
  if(response.statusCode==200){
    print(response.body);
    return User.fromJson(jsonDecode(response.body));


  }
  else{
    throw Exception('=======Echec de la recupération=========');
  }
}
}