class User {
  String? idUtilisateur;
  String? username;
  String? nom;
  String? prenom;
  String? email;
  String? motDePasse;

  User(
      {this.idUtilisateur,
        this.username,
        this.nom,
        this.prenom,
        this.email,
        this.motDePasse});

  User.fromJson(Map<String, dynamic> json) {
    idUtilisateur = json['idUtilisateur'];
    username = json['username'];
    nom = json['nom'];
    prenom = json['prenom'];
    email = json['email'];
    motDePasse = json['motDePasse'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idUtilisateur'] = this.idUtilisateur;
    data['username'] = this.username;
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['email'] = this.email;
    data['motDePasse'] = this.motDePasse;
    return data;
  }
}