import 'package:dashboard_agroinvest/Modele/AgriculteurModele.dart';
import 'package:dashboard_agroinvest/Modele/AjouterCreditmodel.dart';
import 'package:dashboard_agroinvest/Provider/AdminPovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgriculteurDetail extends StatefulWidget {
  const AgriculteurDetail({Key? key, required this.agriculteur}) : super(key: key);
  final Agriculteur? agriculteur;

  @override
  State<AgriculteurDetail> createState() => _AgriculteurDetailState();
}

class _AgriculteurDetailState extends State<AgriculteurDetail> {
  Agriculteur agriculteur = Agriculteur();
  @override
  void initState() {
    agriculteur = context.read<AdminProvider>().agriculteurSelect;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(child: Container(
        child: Card(
          child: Column(
            children: [
              Row(
                children: [
                  Text(agriculteur.nomPrenom!),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
