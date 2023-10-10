class Budget {
  int? idBudget;
  String? titre;
  int? montant;
  String? dateDebut;
  String? dateFin;
  int? montantAlert;
  int? montantRestant;

  Budget(
      {this.idBudget,
      this.titre,
      this.montant,
      this.dateDebut,
      this.dateFin,
      this.montantAlert,
      this.montantRestant});

  Budget.fromJson(Map<String, dynamic> json) {
    idBudget = json["idBudget"];
    titre = json["titre"];
    montant = json["montant"];
    dateDebut = json["dateDebut"];
    dateFin = json["dateFin"];
    montantAlert = json["montantAlert"];
    montantRestant = json["montantRestant"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["idBudget"] = idBudget;
    _data["titre"] = titre;
    _data["montant"] = montant;
    _data["dateDebut"] = dateDebut;
    _data["dateFin"] = dateFin;
    _data["montantAlert"] = montantAlert;
    _data["montantRestant"] = montantRestant;
    return _data;
  }
}
