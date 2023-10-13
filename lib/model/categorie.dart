class Categorie {
  int? idCategorie;
  String? titre;

  Categorie({this.idCategorie, this.titre});

  Categorie.fromJson(Map<String, dynamic> json) {
    idCategorie = json['idCategorie'];
    titre = json['titre'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCategorie'] = this.idCategorie;
    data['titre'] = this.titre;
    return data;
  }
}