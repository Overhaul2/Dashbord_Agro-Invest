import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dashboard_agroinvest/Modele/AgriculteurModele.dart';
import 'package:dashboard_agroinvest/Service/agriculteurService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/AdminPovider.dart';
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
             // HeaderDashboard(),
              SizedBox(height: 40,),
              Text("Lites des Agriculteurs",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold)),
              SizedBox(height: 20,),
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
                                    ? NetworkImage("http://10.0.2.2/"+"${agriculteur.image}") as ImageProvider<Object>?
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
                                      IconButton(onPressed: (){
                                        AwesomeDialog(
                                          context: context,
                                          dialogType: DialogType.warning,
                                          animType: AnimType.topSlide,
                                          showCloseIcon: true,
                                          title: "Bloqué",
                                          desc: "Voulez vous vraiment bloqué cet Agriculteur",
                                          btnCancelOnPress:(){},
                                          btnOkOnPress: (){},
                                        ).show();},
                                          icon: Icon(Icons.block,color: Colors.red,)),
                                    ],
                                  )
                                ],
                              )),
                            ],
                          ),
                        ).toList(),
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



class _AgriculteurPageState1 extends State<AgriculteurPage> {
  AgriculteurService agriculteurService = AgriculteurService();
  late List<Agriculteur> agriculteurs = [];

  int _rowsPerPage = 10;
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderDashboard(),
            SizedBox(height: 40,),
            Text("Liste des Agriculteurs", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            SizedBox(height: 20,),
            FutureBuilder(
              future: agriculteurService.affichertoutAgriculteur(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Erreur: ${snapshot.error}');
                } else {
                  agriculteurs = snapshot.data!;
                  return PaginatedDataTable(
                    header: const Text('Agriculteurs'),
                    rowsPerPage: _rowsPerPage,
                    onRowsPerPageChanged: (value) {
                      setState(() {
                        _rowsPerPage = value!;
                      });
                    },
                    sortColumnIndex: _sortColumnIndex,
                    sortAscending: _sortAscending,
                    columns: [
                      DataColumn(
                        label: Text('ID', style: TextStyle(fontWeight: FontWeight.bold)),
                        onSort: (columnIndex, ascending) {
                          _sort<String>((agriculteur) => agriculteur.idAgr.toString(), columnIndex, ascending);
                        },
                      ),
                      DataColumn(label: Text('Photo', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Nom et Prénom', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Email', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Résidence', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Téléphone', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Actions', style: TextStyle(fontWeight: FontWeight.bold))),
                    ],
                    source: _DataSource(context, agriculteurs),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  // Méthode pour trier la liste
  void _sort<T>(Comparable<T> getField(Agriculteur agriculteur), int columnIndex, bool ascending) {
    agriculteurs.sort((a, b) {
      if (!ascending) {
        final Agriculteur c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }
}

class _DataSource extends DataTableSource {
  final BuildContext context;
  final List<Agriculteur> agriculteurs;

  _DataSource(this.context, this.agriculteurs);

  @override
  DataRow getRow(int index) {
    final Agriculteur agriculteur = agriculteurs[index];
    return DataRow(
      cells: [
        DataCell(Text('${agriculteur.idAgr}', style: TextStyle(fontWeight: FontWeight.bold))),
        DataCell(CircleAvatar(
          backgroundImage: agriculteur.image != null
              ? NetworkImage("${agriculteur.image}") as ImageProvider<Object>?
              : AssetImage("asset/images/user1.png") as ImageProvider<Object>?,
          radius: 20,
        )),
        DataCell(Text('${agriculteur.nomPrenom}')),
        DataCell(Text('${agriculteur.email}')),
        DataCell(Text('${agriculteur.residense}')),
        DataCell(Text('${agriculteur.telephone}')),
        DataCell(Column(
          children: [
            Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.remove_red_eye, color: Colors.blue)),
                IconButton(
                  onPressed: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.warning,
                      animType: AnimType.topSlide,
                      showCloseIcon: true,
                      title: "Bloqué",
                      desc: "Voulez-vous vraiment bloquer cet Agriculteur",
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    ).show();
                  },
                  icon: Icon(Icons.block, color: Colors.red),
                ),
              ],
            )
          ],
        )),
      ],
    );
  }


  navigateToPage(int pageId) {
    switch (pageId) {
      case 10:
        context.read<AdminProvider>().setCurrentIndex(pageId);
        break;
    }
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => agriculteurs.length;

  @override
  int get selectedRowCount => 0;
}