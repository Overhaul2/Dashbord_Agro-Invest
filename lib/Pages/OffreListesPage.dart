import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OffreInvestisseurPage extends StatefulWidget {
  const OffreInvestisseurPage({Key? key}) : super(key: key);

  @override
  State<OffreInvestisseurPage> createState() => _OffreInvestisseurPageState();
}

class _OffreInvestisseurPageState extends State<OffreInvestisseurPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Salut la liste des Offre investiseur"),
    );
  }
}
