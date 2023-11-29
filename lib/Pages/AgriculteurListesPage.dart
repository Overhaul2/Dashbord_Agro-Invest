import 'package:dashboard_agroinvest/Modele/AgriculteurModele.dart';
import 'package:dashboard_agroinvest/Service/agriculteurService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'headerDashboard.dart';

class AgriculteurPage extends StatefulWidget {
  const AgriculteurPage({Key? key}) : super(key: key);

  @override
  State<AgriculteurPage> createState() => _AgriculteurPageState();
}

class _AgriculteurPageState extends State<AgriculteurPage> {
  AgriculteurService agriculteurService = AgriculteurService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderDashboard(),
              SizedBox(height: 40,),

              FutureBuilder(
                future: agriculteurService.affichertoutAgriculteur(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Erreur: ${snapshot.error}');
                  } else {
                    List<Agriculteur> agriculteurs = snapshot.data!;
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
                        rows: agriculteurs
                            .map(
                              (agriculteur) => DataRow(
                            cells: [
                              DataCell(Text('${agriculteur.idAgr}',style: TextStyle(fontWeight: FontWeight.bold),)),
                              DataCell(CircleAvatar(
                                backgroundImage: agriculteur.image!= null
                                    ? NetworkImage("${agriculteur.image}") as ImageProvider<Object>?
                                    : AssetImage("asset/images/user1.png") as ImageProvider<Object>?,
                                radius: 20,
                              ),),
                              DataCell(Text('${agriculteur.nomPrenom} '),),
                              DataCell(Text('${agriculteur.email}')),
                              DataCell(Text('${agriculteur.telephone}')),
                              DataCell(Text('${agriculteur.residense}')),
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
          )),
    );
  }
}
