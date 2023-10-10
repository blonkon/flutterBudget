

class Depense {
    int? idDepense;
    int? montant;
    String? description;
    String? date;

    Depense({this.idDepense, this.montant, this.description, this.date});

    Depense.fromJson(Map<String, dynamic> json) {
        idDepense = json["idDepense"];
        montant = json["montant"];
        description = json["description"];
        date = json["date"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["idDepense"] = idDepense;
        _data["montant"] = montant;
        _data["description"] = description;
        _data["date"] = date;
        return _data;
    }
}