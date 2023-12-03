import 'dart:convert';

class Formation {
  int? idFor;
  String? nom;
  String? description;
  String? video;
  String? video1;
  String? video2;
  String? formationAdmin;

  Formation({
    this.idFor,
    this.nom,
    this.description,
    this.video,
    this.video1,
    this.video2,
    this.formationAdmin,
  });

  Formation copyWith({
    int? idFor,
    String? nom,
    String? description,
    String? video,
    String? video1,
    String? video2,
    String? formationAdmin,
  }) {
    return Formation(
      idFor: idFor ?? this.idFor,
      nom: nom ?? this.nom,
      description: description ?? this.description,
      video: video ?? this.video,
      video1: video1 ?? this.video1,
      video2: video2 ?? this.video2,
      formationAdmin: formationAdmin ?? this.formationAdmin,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idFor': idFor,
      'nom': nom,
      'description': description,
      'video': video,
      'video1': video1,
      'video2': video2,
      'formationAdmin': formationAdmin,
    };
  }

  factory Formation.fromMap(Map<String, dynamic> map) {
    return Formation(
      idFor: map['idFor'],
      nom: map['nom'],
      description: map['description'],
      video: map['video'],
      video1: map['video1'],
      video2: map['video2'],
      formationAdmin: map['formationAdmin'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Formation.fromJson(String source) => Formation.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Formation(idFor: $idFor, nom: $nom, description: $description, video: $video, video1: $video1, video2: $video2, formationAdmin: $formationAdmin)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Formation &&
        other.idFor == idFor &&
        other.nom == nom &&
        other.description == description &&
        other.video == video &&
        other.video1 == video1 &&
        other.video2 == video2 &&
        other.formationAdmin == formationAdmin;
  }

  @override
  int get hashCode {
    return idFor.hashCode ^
    nom.hashCode ^
    description.hashCode ^
    video.hashCode ^
    video1.hashCode ^
    video2.hashCode ^
    formationAdmin.hashCode;
  }
}
