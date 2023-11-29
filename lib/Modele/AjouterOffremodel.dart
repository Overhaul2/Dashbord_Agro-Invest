import 'dart:convert';

import 'AgriculteurModele.dart';
import 'Investisseur.dart';

class Offre {
  int? idOf;
  String? titre;
  String? montant;
  String? dateDebut;
  int? durre;
  String? description;
  String? audioDescriptionPath;
  Agriculteur? agriculteur;
  Investisseur? offreInvestisseur;

  Offre(
      {this.idOf,
        this.titre,
        this.montant,
        this.dateDebut,
        this.durre,
        this.description,
        this.audioDescriptionPath,
        this.agriculteur,
        this.offreInvestisseur,
      });
  Offre copyWith({
    int? idOf,
    String? titre,
    String? montant,
    String? dateDebut,
    int? durre,
    String? description,
    String? audioDescriptionPath,
    Agriculteur? agriculteur,
    Investisseur? offreInvestisseur,
  }) {
    return Offre(
      idOf: idOf?? this.idOf,
      titre: titre ?? this.titre,
      montant: montant ?? this.montant,
      dateDebut: dateDebut ?? this.dateDebut,
      durre: durre ?? this.durre,
      description: description ?? this.description,
      audioDescriptionPath: audioDescriptionPath ?? this.audioDescriptionPath,
      agriculteur: agriculteur ?? this.agriculteur,
      offreInvestisseur: offreInvestisseur ?? this.offreInvestisseur,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idCredit': idOf,
      'titre': titre,
      'montant': montant,
      'dateDebut': dateDebut,
      'durre': durre,
      'description': description,
      'audioDescriptionPath': audioDescriptionPath,
      'agriculteur': agriculteur?.toJson(),
      'offreInvestisseur': offreInvestisseur?.toJson(),
    };
  }

  factory Offre.fromMap(Map<String, dynamic> map) {
    return Offre(
      idOf: map['idOf'] != null ? map['idOf'] as int : null,
      titre: map['titre'] != null ? map['titre'] as String : null,
      montant: map['montant'] != null ? map['montant'] as String : null,
      dateDebut: map['dateDebut'] != null ? map['dateDebut'] as String : null,
      durre: map['durre'] != null ? map['durre'] as int : null,
      description: map['description'] != null ? map['description'] as String : null,
      audioDescriptionPath: map['audioDescriptionPath'] != null ? map['audioDescriptionPath'] as String : null,
      agriculteur: map['agriculteur'] != null ? Agriculteur.fromMap(map['agriculteur'] as Map<String,dynamic>) : null,
      offreInvestisseur: map['offreInvestisseur'] != null ? Investisseur.fromJson(map['offreInvestisseur'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  // factory Credit.fromJson(String source) => Credit.fromMap(json.decode(source) as Map<String, dynamic>);
  factory Offre.fromJson(String source) => Offre.fromMap(json.decode(source) as Map<String, dynamic>);


  @override
  String toString() {
    return 'Offre(idOf: $idOf, titre: $titre, montant: $montant, dateDebut: $dateDebut, duree: $durre, description: $description, audioDescriptionPath: $audioDescriptionPath, agriculteur: $agriculteur, offreInvestisseur: $offreInvestisseur)';
  }

  @override
  bool operator ==(covariant Offre other) {
    if (identical(this, other)) return true;

    return
      other.idOf == idOf &&
          other.titre == titre &&
          other.montant == montant &&
          other.dateDebut == dateDebut &&
          other.durre == durre &&
          other.description == description &&
          other.audioDescriptionPath == audioDescriptionPath &&
          other.agriculteur == agriculteur &&
          other.offreInvestisseur == offreInvestisseur;
  }

  @override
  int get hashCode {
    return idOf.hashCode ^
    titre.hashCode ^
    montant.hashCode ^
    dateDebut.hashCode ^
    durre.hashCode ^
    description.hashCode ^
    audioDescriptionPath.hashCode ^
    agriculteur.hashCode ^
    offreInvestisseur.hashCode;
  }
}
