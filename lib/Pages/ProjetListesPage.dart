import 'package:dashboard_agroinvest/Modele/AjouterCreditmodel.dart';
import 'package:dashboard_agroinvest/Service/CreditService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'headerDashboard.dart';

class ProjetPage extends StatefulWidget {
  const ProjetPage({Key? key}) : super(key: key);

  @override
  State<ProjetPage> createState() => _ProjetPageState();
}

class _ProjetPageState extends State<ProjetPage> {
  CreditServise creditServise = CreditServise();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderDashboard(),
            SizedBox(height: 40,),

            FutureBuilder(
              future: creditServise.CreditAffichertout(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Erreur: ${snapshot.error}');
                } else {
                  List<Credit> credits = snapshot.data!;
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        border: TableBorder(
                          top: BorderSide(color: CupertinoColors.activeGreen),
                           bottom: BorderSide(color: CupertinoColors.activeGreen),
                           left: BorderSide(color: CupertinoColors.activeGreen),
                           right: BorderSide(color: CupertinoColors.activeGreen)
                        ),
                        columns: const [
                          DataColumn(label: Text('ID',style: TextStyle(fontWeight: FontWeight.bold),)),
                          DataColumn(label: Text('Titre',style: TextStyle(fontWeight: FontWeight.bold),)),
                          DataColumn(label: Text('Nom et Prenom Agriculteur',style: TextStyle(fontWeight: FontWeight.bold))),
                          DataColumn(label: Text('Email Agriculteur',style: TextStyle(fontWeight: FontWeight.bold))),
                          DataColumn(label: Text('Telephone Agriculteur',style: TextStyle(fontWeight: FontWeight.bold))),
                          DataColumn(label: Text('Nom et Prenom Investisseur',style: TextStyle(fontWeight: FontWeight.bold))),
                          DataColumn(label: Text('Telephone Investisseur',style: TextStyle(fontWeight: FontWeight.bold))),
                          DataColumn(label: Text('Actions',style: TextStyle(fontWeight: FontWeight.bold))),
                        ],
                        rows: credits
                            .map(
                              (credit) => DataRow(
                            cells: [
                              DataCell(Text('${credit.idCredit}',style: TextStyle(fontWeight: FontWeight.bold),)),
                              DataCell(SizedBox(width: 90,child: Text('${credit.titre} ',style: TextStyle(overflow: TextOverflow.ellipsis),)),),
                              DataCell(Text('${credit.agriculteur?.nomPrenom}')),
                              DataCell(Text('${credit.agriculteur?.email}')),
                              DataCell(Text('${credit.agriculteur?.telephone}')),
                              DataCell(Text('${credit.offreInvestisseur?.email}')),
                              DataCell(Text('${credit.offreInvestisseur?.telephone}')),
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
