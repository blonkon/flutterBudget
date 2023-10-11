class Utilisateur {
  int? idUser;
  String? nom;
  String? prenom;
  String? email;
  String? password;
  String? username;

  Utilisateur({this.idUser, this.username,this.nom,this.prenom,this.email,this.password})
  Utilisateur.fromJson(Map<String, dynamic> json){
    idUser = json["idUser"];
    nom=json["nom"];
    prenom=json["prenom"];
    username=json["nom"];
    email=json["nom"];
    password=json["nom"];
  }
  Map<String, dynamic>toJson()=>{
    // final Map<String, dynamic> _data=<String, dynamic>{}
    "idUser"=idUser,
    "nom"=nom,
    "prenom"=prenom,
    "username"=username,
    "email"=email,
    "password"=password,
  };
}