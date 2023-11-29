import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



import '../Modele/AjouterOffremodel.dart';

class OffreService{
  final BuildContext context;
  OffreService(this.context);

  Future<List<Offre>>  OffreAffichertout() async {
    //print('Avant recuperation');
    final response = await http.get(Uri.parse("http://localhoste:8080/offre/affichertout"));
    // print('Apres recup : ${response.statusCode}');

    if (response.statusCode == 200) {
      // print("on est a 200" );
      final responseData = jsonDecode(response.body) as List;
      List<Offre> offres = responseData
          .map((offre) => Offre.fromMap(offre))
          .toList();

      print(OffreAffichertout);
      return offres;
    } else {
      throw Exception('Impossible de recuperer les offres');
    }
  }

}