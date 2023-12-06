
import 'package:dashboard_agroinvest/Modele/AjouterCreditmodel.dart';
import 'package:dashboard_agroinvest/Service/CreditService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/AdminPovider.dart';
import 'headerDashboard.dart';

class ProjetPage extends StatefulWidget {
  const ProjetPage({Key? key}) : super(key: key);

  @override
  State<ProjetPage> createState() => _ProjetPageState();
}

class _ProjetPageState extends State<ProjetPage> {
  CreditServise creditServise = CreditServise();
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //HeaderDashboard(),
            SizedBox(height: 40,),
            Text("Liste des Projets Agricoles", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            SizedBox(height: 20,),
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
                    padding: const EdgeInsets.only(right: 10),
                    child: PaginatedDataTable(
                      //header: const Text('Projets'),
                      columns: const [
                        DataColumn(label: Text('ID', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('Titre', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('Montant', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('Nom et Prenom Agriculteur', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('Nom et Prenom Investisseur', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('Actions', style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                      source: _MyDataSource(credits, context),
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
  final List<Credit> _credits;
  final BuildContext context;

  _MyDataSource(this._credits, this.context);

  @override
  DataRow? getRow(int index) {
    if (index >= _credits.length) {
      return null;
    }
    final credit = _credits[index];
    return DataRow(
      cells: [
        DataCell(Text('${credit.idCredit}',
            style: TextStyle(fontWeight: FontWeight.bold))),
        DataCell(SizedBox(width: 200,
            child: Text('${credit.titre} ',
                style: TextStyle(overflow: TextOverflow.ellipsis)))),
        DataCell(Text('${credit.montant} Fcfa',
            style: TextStyle(overflow: TextOverflow.ellipsis))),
        DataCell(SizedBox(
            width: 180, child: Text('${credit.agriculteur?.nomPrenom}'))),
        DataCell(SizedBox(
            width: 180, child: Text('${credit.offreInvestisseur?.nomPrenom}'))),
        DataCell(Column(
          children: [
            Row(
              children: [
                IconButton(onPressed: () {
                  context.read<AdminProvider>().creditEnCours = credit;
                  navigateToPage(8);
                },
                    icon: Icon(Icons.remove_red_eye, color: Colors.blue,)),
                IconButton(onPressed: () {},
                    icon: Icon(Icons.block, color: Colors.red,)),
              ],
            )
          ],
        )),
      ],
    );
  }




  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _credits.length;

  @override
  int get selectedRowCount => 0;

  navigateToPage(int pageId) {
    switch (pageId) {
      case 8:
        context.read<AdminProvider>().setCurrentIndex(pageId);
        // Navigation vers la page Dashboard
        break;
    }
  }
}
