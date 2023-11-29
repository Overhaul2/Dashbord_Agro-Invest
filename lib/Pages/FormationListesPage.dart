import 'package:flutter/material.dart';

class FormationsPage extends StatefulWidget {
  const FormationsPage({Key? key}) : super(key: key);

  @override
  State<FormationsPage> createState() => _FormationsPageState();
}

class _FormationsPageState extends State<FormationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Salut la liste des formation"),
    );
  }
}
