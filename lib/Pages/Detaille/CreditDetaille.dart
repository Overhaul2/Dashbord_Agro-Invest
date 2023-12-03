import 'package:dashboard_agroinvest/Modele/AjouterCreditmodel.dart';
import 'package:dashboard_agroinvest/Provider/AdminPovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreditDetail extends StatefulWidget {
  const CreditDetail({Key? key, required this.credit}) : super(key: key);
  final Credit? credit;

  @override
  State<CreditDetail> createState() => _CreditDetailState();
}

class _CreditDetailState extends State<CreditDetail> {
  Credit credit = Credit();
  @override
  void initState() {
    credit = context.read<AdminProvider>().creditEnCours;
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
                  Text(credit.montant!),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
