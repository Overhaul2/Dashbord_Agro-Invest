import 'package:flutter/material.dart';

import '../Modele/Investisseur.dart';
import '../Service/investisseurService.dart';
import 'headerDashboard.dart';

class InvestisseurListe extends StatefulWidget {
  const InvestisseurListe({Key? key}) : super(key: key);

  @override
  State<InvestisseurListe> createState() => _InvestisseurListeState();
}

class _InvestisseurListeState extends State<InvestisseurListe> {
  InvestisseurService investisseurServices = InvestisseurService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderDashboard(),
            SizedBox(height: 40,),

            FutureBuilder(
              future: investisseurServices.InvestisseurAffichertout(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Erreur: ${snapshot.error}');
                } else {
                  List<Investisseur> investisseurs = snapshot.data!;
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('ID',style: TextStyle(fontWeight: FontWeight.bold),)),
                        DataColumn(label: Text('Photo',style: TextStyle(fontWeight: FontWeight.bold),)),
                        DataColumn(label: Text('Nom et Prenom',style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('Email',style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('Résidence',style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('Age',style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('Actions',style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                      rows: investisseurs
                          .map(
                            (investisseur) => DataRow(
                          cells: [
                            DataCell(Text('${investisseur.idInv}',style: TextStyle(fontWeight: FontWeight.bold),)),
                            DataCell(CircleAvatar(
                              backgroundImage: investisseur.image!= null
                                  ? NetworkImage("${investisseur.image}") as ImageProvider<Object>?
                                  : AssetImage("asset/images/user1.png") as ImageProvider<Object>?,
                              radius: 20,
                            ),),
                            DataCell(Text('${investisseur.nomPrenom} '),),
                            DataCell(Text('${investisseur.email}')),
                            DataCell(Text('${investisseur.telephone}')),
                            DataCell(Text('${investisseur.residense}')),
                            DataCell(Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye,color: Colors.blue,)),
                                    IconButton(onPressed: (){}, icon: Icon(Icons.block,color: Colors.red,)),
                                  ],
                                )
                              ],
                            )),
                          ],
                        ),
                      )
                          .toList(),
                    ),
                  );
                }
              },
            ),

          ],
        ),
      ),
    );
  }
}
