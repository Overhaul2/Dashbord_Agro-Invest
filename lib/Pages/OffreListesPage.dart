import 'dart:js';

import 'package:dashboard_agroinvest/Service/OffreService.dart';
import 'package:flutter/material.dart';


import '../Modele/AjouterOffremodel.dart';
import '../Provider/AdminPovider.dart';
import 'headerDashboard.dart';

class OffreInvestisseurPage extends StatefulWidget {
  const OffreInvestisseurPage({Key? key}) : super(key: key);

  @override
  State<OffreInvestisseurPage> createState() => _OffreInvestisseurPageState();
}

class _OffreInvestisseurPageState extends State<OffreInvestisseurPage> {
  OffreService offreService = OffreService();
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderDashboard(),
            SizedBox(height: 40,),
            Text("Liste des Offres Investisseur", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            SizedBox(height: 20,),
            FutureBuilder(
              future: offreService.OffreAffichertout(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Erreur: ${snapshot.error}');
                } else {
                  List<Offre> offres = snapshot.data!;
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: PaginatedDataTable(
                      columns: const [
                        DataColumn(label: Text('ID', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('Titre', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('Montant', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('Nom et Prenom Investisseur', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('Nom et Prenom Agriculteur', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('Actions', style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                      source: _MyDataSource(offres),
                      rowsPerPage: 10,
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

class _MyDataSource extends DataTableSource {
  final List<Offre> _offres;

  _MyDataSource(this._offres);

  @override
  DataRow? getRow(int index) {
    if (index >= _offres.length) {
      return null;
    }
    final offre =  _offres[index];
    //print(offre.toString());
    return DataRow(
      cells: [
        DataCell(Text('${offre.idOf}', style: TextStyle(fontWeight: FontWeight.bold))),
        DataCell(SizedBox(width: 200, child: Text('${offre.titre} ', style: TextStyle(overflow: TextOverflow.ellipsis)))),
        DataCell(Text('${offre.montant} Fcfa', style: TextStyle(overflow: TextOverflow.ellipsis))),
        DataCell(SizedBox(width: 180,child: Text('${offre.investisseur?.nomPrenom}'))),
        DataCell(SizedBox(width: 180,child: Text('${offre.agriculteur?.nomPrenom}'))),
        DataCell(Column(
          children: [
            Row(
              children: [
                IconButton(onPressed: () {
                 // context.read<AdminProvider>().offreSelect= offre;
                  navigateToPage(9);
                }, icon: Icon(Icons.remove_red_eye, color: Colors.blue,)),
                IconButton(onPressed: () {}, icon: Icon(Icons.block, color: Colors.red,)),
              ],
            )
          ],
        )),
      ],
    );
  }

  navigateToPage(int pageId) {
    switch (pageId) {
      case 9:
       // context.read<AdminProvider>().setCurrentIndex(pageId);
        // Navigation vers la page Dashboard
        break;
    }
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _offres.length;

  @override
  int get selectedRowCount => 0;
}
