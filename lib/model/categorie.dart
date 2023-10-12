class Categorie {
  int? idCategory;
  String? nom;

  Categorie({this.idCategory, this.nom});

  Categorie.fromJson(Map<String, dynamic> json) {
    idCategory = json['idCategory'];
    nom = json['nom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCategory'] = this.idCategory;
    data['nom'] = this.nom;
    return data;
  }
}
