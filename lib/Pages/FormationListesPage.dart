import 'package:flutter/material.dart';

import 'headerDashboard.dart';

class FormationsPage extends StatefulWidget {
  const FormationsPage({Key? key}) : super(key: key);

  @override
  State<FormationsPage> createState() => _FormationsPageState();
}

class _FormationsPageState extends State<FormationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          HeaderDashboard(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Formations",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [Text("Ajouter"), Icon(Icons.add)],
                  ))
            ],
          ),
        ],
      )),
    );
  }
}

