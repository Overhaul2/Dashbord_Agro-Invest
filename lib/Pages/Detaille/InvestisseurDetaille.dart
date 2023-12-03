import 'package:dashboard_agroinvest/Modele/AjouterCreditmodel.dart';
import 'package:dashboard_agroinvest/Modele/Investisseur.dart';
import 'package:dashboard_agroinvest/Provider/AdminPovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InvestisseurDetail extends StatefulWidget {
  const InvestisseurDetail({Key? key, required this.investisseur}) : super(key: key);
  final Investisseur? investisseur;

  @override
  State<InvestisseurDetail> createState() => _InvestisseurDetailState();
}

class _InvestisseurDetailState extends State<InvestisseurDetail> {
  Investisseur investisseur = Investisseur();
  @override
  void initState() {
    investisseur = context.read<AdminProvider>().investisseurSelect;
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
                  Text(investisseur.nomPrenom!),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
