import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Modele/Investisseur.dart';

class InvestisseurService {

  Future<List<Investisseur>>  InvestisseurAffichertout() async {
    print('Avant recuperation');
    final response = await http.get(Uri.parse("http://localhost:8080/investisseur/affichertout"));
     print('Apres recup : ${response.body}');

    if (response.statusCode == 200) {
      // print("on est a 200" );
      final responseData = jsonDecode(response.body) as List;
      List<Investisseur> investisseurs = responseData
          .map((investisseur) => Investisseur.fromJson(investisseur))
          .toList();

      print(InvestisseurAffichertout);
      return investisseurs;
    } else {
      throw Exception('Impossible de recuperer les offres');
    }
  }



}
