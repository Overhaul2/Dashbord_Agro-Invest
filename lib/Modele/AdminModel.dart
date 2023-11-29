import 'dart:convert';

class Admin {
  int? idAd;
  String? nom;
  String? prenom;
  String? email;
  String? passWord;

  Admin({this.idAd, this.nom, this.prenom, this.email, this.passWord});

  Admin copyWith({
    int? idAd,
    String? nom,
    String? prenom,
    String? email,
    String? passWord,
  }) {
    return Admin(
      idAd: idAd ?? this.idAd,
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
      email: email ?? this.email,
      passWord: passWord ?? this.passWord,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idAd': idAd,
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'passWord': passWord,
    };
  }

  factory Admin.fromMap(Map<String, dynamic> map) {
    return Admin(
      idAd: map['idAd'] != null ? map['idAd'] as int : null,
      nom: map['nom'] != null ? map['nom'] as String : null,
      prenom: map['prenom'] != null ? map['prenom'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      passWord: map['passWord'] != null ? map['passWord'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Admin.fromJson(String source) =>
      Admin.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Admin(idAd: $idAd, nom: $nom, prenom: $prenom, email: $email, passWord: $passWord)';
  }

  @override
  bool operator ==(covariant Admin other) {
    if (identical(this, other)) return true;
    return other.idAd == idAd &&
        other.nom == nom &&
        other.prenom == prenom &&
        other.email == email &&
        other.passWord == passWord;
  }

  @override
  int get hashCode {
    return idAd.hashCode ^
    nom.hashCode ^
    prenom.hashCode ^
    email.hashCode ^
    passWord.hashCode;
  }
}
