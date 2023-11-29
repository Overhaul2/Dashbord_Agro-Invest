import 'dart:convert';

class Agriculteur {
  int? idAgr;
  String? nomPrenom;
  String? email;
  int? telephone;
  String? residense;
  int? age;
  String? image;
  String? passWord;
  String? passWordConfirm;
  String? activiteMenee;

  Agriculteur({this.idAgr,
    this.nomPrenom,
    this.email,
    this.telephone,
    this.residense,
    this.age,
    this.image,
    this.passWord,
    this.passWordConfirm,
    this.activiteMenee});

  Agriculteur copyWith({int? idAgr,
    String? nomPrenom,
    String? email,
    int? telephone,
    String? residense,
    int? age,
    String? image,
    String? passWord,
    String? passWordConfirm}) {
    return Agriculteur(
        idAgr: idAgr ?? this.idAgr,
        nomPrenom: nomPrenom ?? this.nomPrenom,
        email: email ?? this.email,
        telephone: telephone ?? this.telephone,
        residense: residense ?? this.residense,
        age: age ?? this.age,
        image: image ?? this.image,
        passWord: passWord ?? this.passWord,
        passWordConfirm: passWordConfirm ?? this.passWordConfirm,
        activiteMenee: activiteMenee ?? this.activiteMenee);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idAgr': idAgr,
      'nomPrenom': nomPrenom,
      'email': email,
      'telephone': telephone,
      'residense': residense,
      'age': age,
      'image': image,
      'passWord': passWord,
      'passWordConfirm': passWordConfirm,
      'activiteMenee': activiteMenee,
    };
  }

  factory Agriculteur.fromMap(Map<String, dynamic> map) {
    return Agriculteur(
      idAgr: map['idAgr'] != null ? map['idAgr'] as int : null,
      nomPrenom: map['nomPrenom'] != null ? map['nomPrenom'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      telephone: map['telephone'] != null ? map['telephone'] as int : null,
      age: map['age'] != null ? map['age'] as int : null,
      residense: map['residense'] != null ? map['residense'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      activiteMenee: map['activiteMenee'] != null
          ? map['activiteMenee'] as String
          : null,
      passWord: map['passWord'] != null ? map['passWord'] as String : null,
      passWordConfirm: map['passWordConfirm'] != null
          ? map['passWordConfirm'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  // factory Credit.fromJson(String source) => Credit.fromMap(json.decode(source) as Map<String, dynamic>);
  factory Agriculteur.fromJson(String source) =>
      Agriculteur.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return (
        'Agriculteur(idAgr: $idAgr,nomPrenom: $nomPrenom, email: $email, telephone: $telephone, residense: $residense, age: $age, image: $image, activiteMenee: $activiteMenee ,passWord:  $passWord ,passWordConfirm: $passWordConfirm)'
    );
  }

  @override
  bool operator ==(covariant Agriculteur other) {
    if (identical(this, other)) return true;
    return
      other.idAgr == idAgr &&
          other.nomPrenom == nomPrenom &&
          other.email == email &&
          other.telephone == telephone &&
          other.age == age &&
          other.image == image &&
          other.residense == residense &&
          other.activiteMenee == activiteMenee &&
          other.passWord == passWord &&
          other.passWordConfirm == passWordConfirm;
  }

  @override
  int get hashCode {
    return idAgr.hashCode ^
    nomPrenom.hashCode ^
    email.hashCode ^
    telephone.hashCode ^
    age.hashCode ^
    residense.hashCode ^
    image.hashCode ^
    passWord.hashCode ^
    passWordConfirm.hashCode;
  }
}
