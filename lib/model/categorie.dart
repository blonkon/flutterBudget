class Categorie {
    String? titre;

    Categorie({this.titre});

    Categorie.fromJson(Map<String, dynamic> json) {
        titre = json["titre"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["titre"] = titre;
        return _data;
    }
}