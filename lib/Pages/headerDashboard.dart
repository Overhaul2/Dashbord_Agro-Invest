import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderDashboard extends StatefulWidget {
  const HeaderDashboard({Key? key}) : super(key: key);

  @override
  State<HeaderDashboard> createState() => _HeaderDashboardState();
}

class _HeaderDashboardState extends State<HeaderDashboard> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: 20, right: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
       // SizedBox(height: 20,),
        //const Expanded(child: Text("Dashbord")),
        Container(
          width: 300,
          child: Row(
            children: [
              Expanded(child: CupertinoSearchTextField(
                  placeholder: "Rechercher",
              borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              ),
            ],
          ),
        ),
        /*Expanded(child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.notifications_active_outlined))
          ],
        ))*/
      ],
    ),);
  }
}



class Projets extends StatelessWidget {
  const Projets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const Placeholder();
  }
}

