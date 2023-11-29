import 'package:dashboard_agroinvest/Pages/Dashboard.dart';
import 'package:dashboard_agroinvest/Pages/logiAdmin.dart';
import 'package:dashboard_agroinvest/Provider/AdminPovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Pages/ProjetListesPage.dart';

class Side_Menu extends StatefulWidget {
  const Side_Menu({Key? key}) : super(key: key);

  @override
  State<Side_Menu> createState() => _Side_MenuState();
}

class _Side_MenuState extends State<Side_Menu> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset("asset/images/logo.png"),
            ),
            MenuListe(
              title: "Dashboard",
              icon: Icon(Icons.dashboard_outlined),
              press: () => navigateToPage(1),
            ),
            MenuListe(
              title: "Projets",
              icon: Icon(Icons.share),
              press: () => navigateToPage(2),
            ),
            MenuListe(
              title: "Offres",
              icon: Icon(Icons.gif_box),
              press: () => navigateToPage(3),
            ),
            MenuListe(
              title: "Agriculteurs",
              icon: Icon(Icons.person),
              press: () => navigateToPage(4),
            ),
            MenuListe(
              title: "Investisseurs",
              icon: Icon(Icons.person),
              press: () => navigateToPage(5),

            ),
            MenuListe(
              title: "Formations",
              icon: Icon(Icons.bookmark_add_outlined),
              press: () => navigateToPage(6),

            ),
            MenuListe(
              title: "Paramettrage",
              icon: Icon(Icons.settings),
              press: () => navigateToPage(7),
            ),
            MenuListe(
              title: "Deconnexion",
              icon: Icon(Icons.logout),
              press: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginAdmin()));
                },
            ),
          ],
        ),
      ),
    );
  }

  void navigateToPage(int pageId) {
    switch (pageId) {
      case 0: context.read<AdminProvider>().setCurrentIndex(pageId);
      // Navigation vers la page Dashboard
        break;
      case 1:
        context.read<AdminProvider>().setCurrentIndex(pageId);
        //Navigator.pushReplacement(_navigatorKey.currentState, MaterialPageRoute(builder: (context)=>));
      // Navigation vers la page Projets
        break;
      case 2: context.read<AdminProvider>().setCurrentIndex(pageId);
      // Navigation vers la page Agriculteurs
        break;
      case 3: context.read<AdminProvider>().setCurrentIndex(pageId);
      // Navigation vers la page Investisseurs
        break;
      case 4: context.read<AdminProvider>().setCurrentIndex(pageId);
      // Navigation vers la page Formations
        break;
      case 5: context.read<AdminProvider>().setCurrentIndex(pageId);
      // Navigation vers la page Paramettrage
        break;
        case 6: context.read<AdminProvider>().setCurrentIndex(pageId);
      // Navigation vers la page Paramettrage
        break;
      case 7: context.read<AdminProvider>().setCurrentIndex(pageId);
      // Navigation vers la page Deconnexion;
        break;
      default:
        break;
    }
  }
}

class MenuListe extends StatelessWidget {
  const MenuListe({
    Key? key,
    required this.title,
    required this.icon,
    required this.press,
    //required this.id,
  }) : super(key: key);

  final String title;
  final Icon icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 10,
      leading: icon,
      title: Text(title),
    );
  }
}
