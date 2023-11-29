import 'package:dashboard_agroinvest/Composan/side_Barre.dart';
import 'package:dashboard_agroinvest/Pages/AgriculteurListesPage.dart';
import 'package:dashboard_agroinvest/Pages/Dashboard.dart';
import 'package:dashboard_agroinvest/Pages/FormationListesPage.dart';
import 'package:dashboard_agroinvest/Pages/InvestisseurListesPage.dart';
import 'package:dashboard_agroinvest/Pages/OffreListesPage.dart';
import 'package:dashboard_agroinvest/Provider/AdminPovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ParametragePage.dart';
import 'ProjetListesPage.dart';
class Accueille extends StatefulWidget {
  const Accueille({Key? key}) : super(key: key);

  @override
  State<Accueille> createState() => _AccueilleState();
}

class _AccueilleState extends State<Accueille> {
  List<Widget> dashPagesList=[
    DashBoard(),
    DashBoard(),
    ProjetPage(),
    OffreInvestisseurPage(),
    AgriculteurPage(),
    InvestisseurListe(),
    FormationsPage(),
    Parametrage(),
    //LoginAdmin(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    currentIndex = Provider.of<AdminProvider>(context).currentIndex;
    return SafeArea(child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Side_Menu()),

        Expanded(
          flex: 4,
            child: dashPagesList[currentIndex],)
      ],
    ));
  }
}
