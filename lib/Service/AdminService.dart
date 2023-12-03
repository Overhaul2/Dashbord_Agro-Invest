import 'dart:convert';

import 'package:dashboard_agroinvest/Modele/AdminModel.dart';
import 'package:dashboard_agroinvest/Modele/FormationModel.dart';

import 'package:http/http.dart' as http;

class AdminService{


  Future<Admin?> loginAdmin(String email, String password) async {
    //const apiUrl = "http://localhost:8080/agriculteur/connexion";
    const apiUrl = "http://localhost:8080/Admin/connexion";

    final response =
    await http.get(Uri.parse("$apiUrl?email=$email&password=$password"));

    if (response.statusCode == 200) {
      // Connexion réussie
      return Admin.fromMap(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      print(response.body);
      // Identifiants invalides
      return null;
    }
  }

  Future<List<Formation>>  CreditAffichertout() async {
    //print('Avant recuperation');
    final response = await http.get(Uri.parse("http://localhost:8080/formation/affichertout"));
    //print('Apres recup : ${response.body}');
    if (response.statusCode == 200) {
      // print("on est a 200" );
      final responseData = jsonDecode(response.body) as List;
      List<Formation> formations = responseData
          .map((formation) => Formation.fromMap(formation))
          .toList();
      return formations;
    } else {
      throw Exception('Impossible de recuperer les formation');
    }
  }


}