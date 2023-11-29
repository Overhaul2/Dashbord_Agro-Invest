import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Pages/Acceuilpage.dart';
import 'Provider/AdminPovider.dart';
import 'configuration/configurationCouleur.dart';

void main() {
  runApp(
      ChangeNotifierProvider<AdminProvider>(
          create: (context) => AdminProvider(),
       child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agro_Invest Admin',
      theme: ThemeData(
        splashColor: MesCouleur().couleurPrincipal,
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home:  Accueille(),
    );
  }
}
