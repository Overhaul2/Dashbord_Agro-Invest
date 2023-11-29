import 'dart:convert';

import 'package:dashboard_agroinvest/Modele/AjouterCreditmodel.dart';
import 'package:http/http.dart' as http;

class CreditServise{



  Future<List<Credit>>  CreditAffichertout() async {
    print('Avant recuperation');
    final response = await http.get(Uri.parse("http://localhost:8080/Credit/affichertout"));
    print('Apres recup : ${response.body}');

    if (response.statusCode == 200) {
      // print("on est a 200" );
      final responseData = jsonDecode(response.body) as List;
      List<Credit> credits = responseData
          .map((credit) => Credit.fromMap(credit))
          .toList();

      return credits;
    } else {
      throw Exception('Impossible de recuperer les offres');
    }
  }


}