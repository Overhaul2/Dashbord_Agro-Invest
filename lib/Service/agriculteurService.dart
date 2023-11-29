import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../Modele/AgriculteurModele.dart';
import '../Modele/AjouterCreditmodel.dart';

class AgriculteurService {
  //creation de la methode inscrire agriculteur
  static const String baseUrl = "http://10.0.2.2:8080/agriculteur/inscrire";

  Future<Agriculteur> inscrire({
    // required BuildContext context,
    required String nomPrenom,
    required String email,
    required String telephone,
    required String residense,
    required int age,
    required String passWord,
    required String passWordConfirm,
    required String ActiviteMenee,
    File? image,
  }) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://10.0.2.2:8080/agriculteur/inscrire'),
      );

     if (image != null) {
        try {
          var imageBytes = await image.readAsBytes();
          request.files.add(http.MultipartFile(
            'image',
            ByteStream.fromBytes(imageBytes), //
            imageBytes.length,
          ));
        } catch (e) {
          print('Erreur lors de la lecture de l\'image : $e');
          // Gestion des erreurs
          throw Exception('Erreur lors de la lecture de l\'image : $e');
        }
      }
      request.fields['agriculteur'] = json.encode({
        'nomPrenom': nomPrenom,
        'email': email,
        'age': age,
        'residense': residense,
        'activiteMenee': ActiviteMenee,
        'telephone': telephone,
        //'image': image,
        'passWord': passWord,
        'passWordConfirm': passWordConfirm,
      });

      var response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = json.decode(await response.stream.bytesToString());
        Agriculteur agriculteur = Agriculteur.fromJson(responseData);
        // context.read<AgriculteurProvider>().setAgriculteur(agriculteur);
        return agriculteur;
      } else {
        final errorResponse = await response.stream.bytesToString();
        print(
            'Impossible de créer un compte ${response.statusCode}, Message d\'erreur : $errorResponse');
        throw Exception('Échec : $errorResponse');
      }

    } catch (e) {
      throw Exception('ERREUR : $e');
    }
  }



  Future<List<Agriculteur>>  affichertoutAgriculteur() async {
    //print('Avant recuperation');
    final response = await http.get(Uri.parse("http://localhost:8080/agriculteur/affichertout"));
    // print('Apres recup : ${response.statusCode}');

    if (response.statusCode == 200) {
      // print("on est a 200" );
      final responseData = jsonDecode(response.body) as List;
      List<Agriculteur> agriculteurs = responseData
          .map((agriculteur) => Agriculteur.fromMap(agriculteur))
          .toList();

      //print(affichertout);
      return agriculteurs;
    } else {
      throw Exception('Impossible de recuperer les Agriculteur a proximoté');
    }
  }

  //liste des demande effectuer

  List<Credit> parseCredit(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Credit>((json) => Credit.fromJson(json)).toList();
  }
//recuperer tout les demandes de crédit agricole
  Future<List<Credit>>  affichertout() async {
    //print('Avant recuperation');
    final response = await http.get(Uri.parse("http://10.0.2.2:8080/Credit/affichertout"));
   // print('Apres recup : ${response.statusCode}');

    if (response.statusCode == 200) {
     // print("on est a 200" );
      final responseData = jsonDecode(response.body) as List;
      List<Credit> credits = responseData
          .map((credit) => Credit.fromMap(credit))
          .toList();

      print(affichertout);
     return credits;
    } else {
      throw Exception('Impossible de recuperer les credits');
    }
  }
//recuperer les demande de credit effectuer par l'agriculteur connecter
  Future<List<Credit>> CreditAgriculteur(int idAgr) async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/Credit/list/$idAgr'));

    if (response.statusCode == 200) {
      print(response);
      List<dynamic> data = jsonDecode(response.body);
      List<Credit> credits = data.map((creditData) => Credit.fromMap(creditData)).toList();
      return credits;
    } else {
      throw Exception('Vous n\'avez effectuer aucune demande');
    }
  }


}
