class ModifierUtilisateur {
  String? _idUtilisateur;
  String? _username;
  String? _nom;
  String? _prenom;
  String? _email;
  String? _motDePasse;

  ModifierUtilisateur(
      {String? idUtilisateur,
        String? username,
        String? nom,
        String? prenom,
        String? email,
        String? motDePasse}) {
    if (idUtilisateur != null) {
      this._idUtilisateur = idUtilisateur;
    }
    if (username != null) {
      this._username = username;
    }
    if (nom != null) {
      this._nom = nom;
    }
    if (prenom != null) {
      this._prenom = prenom;
    }
    if (email != null) {
      this._email = email;
    }
    if (motDePasse != null) {
      this._motDePasse = motDePasse;
    }
  }

  String? get idUtilisateur => _idUtilisateur;
  set idUtilisateur(String? idUtilisateur) => _idUtilisateur = idUtilisateur;
  String? get username => _username;
  set username(String? username) => _username = username;
  String? get nom => _nom;
  set nom(String? nom) => _nom = nom;
  String? get prenom => _prenom;
  set prenom(String? prenom) => _prenom = prenom;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get motDePasse => _motDePasse;
  set motDePasse(String? motDePasse) => _motDePasse = motDePasse;

  ModifierUtilisateur.fromJson(Map<String, dynamic> json) {
    _idUtilisateur = json['idUtilisateur'];
    _username = json['username'];
    _nom = json['nom'];
    _prenom = json['prenom'];
    _email = json['email'];
    _motDePasse = json['motDePasse'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idUtilisateur'] = this._idUtilisateur;
    data['username'] = this._username;
    data['nom'] = this._nom;
    data['prenom'] = this._prenom;
    data['email'] = this._email;
    data['motDePasse'] = this._motDePasse;
    return data;
  }
}
