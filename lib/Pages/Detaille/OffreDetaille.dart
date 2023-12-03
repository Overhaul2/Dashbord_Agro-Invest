import 'package:dashboard_agroinvest/Modele/AjouterCreditmodel.dart';
import 'package:dashboard_agroinvest/Modele/AjouterOffremodel.dart';
import 'package:dashboard_agroinvest/Provider/AdminPovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OffreDetail extends StatefulWidget {
  const OffreDetail({Key? key, required this.offre}) : super(key: key);
  final Offre? offre;

  @override
  State<OffreDetail> createState() => _OffreDetailState();
}

class _OffreDetailState extends State<OffreDetail> {
  Offre offre = Offre();
  @override
  void initState() {
    offre = context.read<AdminProvider>().offreSelect;
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
                  Text(offre.montant!),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
