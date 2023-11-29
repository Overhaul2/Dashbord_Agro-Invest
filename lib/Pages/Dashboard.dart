import 'package:dashboard_agroinvest/Pages/headerDashboard.dart';
import 'package:dashboard_agroinvest/Pages/logiAdmin.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderDashboard(),
          SizedBox(height: 40,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 40,),
                Projets(title: 'Projets ',
                  Total: 165,
                  icon: Icon(Icons.share), press: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginAdmin()));
                  },),
              SizedBox(width: 40,),
              Projets(title: 'Agriculteur',
                  Total: 165,
                  icon: Icon(Icons.person), press: (){},),
              SizedBox(width: 40,),
               Projets(title: 'Investisseur',
                  Total: 165,
                  icon: Icon(Icons.person_outline_outlined), press: (){},),
            ],
          ),
        ],
      ),
    );
  }
}

class Projets extends StatelessWidget {
  const Projets({Key? key, required this.title, required this.Total, required this.icon, required this.press}) : super(key: key);

  final String title ;
  final int Total;
  final Icon icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150,
        width: 300,
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: Colors.green),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("$Total", style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold)),
                      Text(title, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Icon(icon.icon,size: 100),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
