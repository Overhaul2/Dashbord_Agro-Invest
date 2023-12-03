import 'dart:js';

import 'package:flutter/material.dart';

import '../Modele/Investisseur.dart';
import '../Provider/AdminPovider.dart';
import '../Service/investisseurService.dart';
import 'headerDashboard.dart';

class InvestisseurListe extends StatefulWidget {
  const InvestisseurListe({Key? key}) : super(key: key);

  @override
  State<InvestisseurListe> createState() => _InvestisseurListeState();
}

class _InvestisseurListeState extends State<InvestisseurListe> {
  InvestisseurService investisseurServices = InvestisseurService();
  int _rowsPerPage = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderDashboard(),
            SizedBox(height: 40,),
            Text("Liste des Investisseurs",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold)),
            SizedBox(height: 20,),
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
                    child: PaginatedDataTable(
                    //  actions: [ AlertDialog(title: Card(child: Text("Salut"),),)],
                    //  header: const Text('Investisseurs'),

                      rowsPerPage: _rowsPerPage,
                      onRowsPerPageChanged: (newRowsPerPage) {
                        setState(() {
                          _rowsPerPage = newRowsPerPage ?? 10;
                        });
                      },
                      columns: const [
                        DataColumn(label: Text('ID',style: TextStyle(fontWeight: FontWeight.bold),)),
                        DataColumn(label: Text('Photo',style: TextStyle(fontWeight: FontWeight.bold),)),
                        DataColumn(label: SizedBox(height: 60,child: Text('Nom et Prenom',style: TextStyle(fontWeight: FontWeight.bold)))),
                        DataColumn(label: Text('Email',style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('Résidence',style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('Age',style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('Actions',style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                      source: _InvestisseurDataSource(investisseurs),
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

class _InvestisseurDataSource extends DataTableSource {
  final List<Investisseur> _investisseurs;

  _InvestisseurDataSource(this._investisseurs);

  @override
  DataRow getRow(int index) {
    final investisseur = _investisseurs[index];
    return DataRow(
      cells: [
        DataCell(Text('${investisseur.idInv}', style: TextStyle(fontWeight: FontWeight.bold),)),
        DataCell(CircleAvatar(
          backgroundImage: investisseur.image != null
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
                IconButton(onPressed: (){
                 /* context.read<AdminProvider>().investisseurSelect = investisseur;
                  navigateToPage(11);*/
                }, icon: Icon(Icons.remove_red_eye,color: Colors.blue,)),
                IconButton(onPressed: (){}, icon: Icon(Icons.block,color: Colors.red,)),
              ],
            )
          ],
        )),
      ],
    );
  }

  navigateToPage(int pageId) {
    switch (pageId) {
      case 11:
       /* context.read<AdminProvider>().setCurrentIndex(pageId);
        // Navigation vers la page Dashboard*/
        break;
    }
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _investisseurs.length;

  @override
  int get selectedRowCount => 0;
}
