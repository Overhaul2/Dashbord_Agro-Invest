import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Modele/AjouterOffremodel.dart';

class OffreService{

  Future<List<Offre>>  OffreAffichertout() async {
    //print('Avant recuperation');
    final response = await http.get(Uri.parse("http://localhost:8080/offre/affichertout"));
    // print('Apres recup : ${response.statusCode}');
    if (response.statusCode == 200) {
     // print(response.body);
      final responseData = jsonDecode(response.body) as List;
      List<Offre> offres = responseData
          .map((offre) => Offre.fromMap(offre))
          .toList();

     //print(offres.toString());
      return offres;
    } else {
      throw Exception('Impossible de recuperer les offres');
    }
  }

}