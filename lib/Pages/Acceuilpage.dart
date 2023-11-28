
import 'package:flutter/material.dart';

class Acceuilpage extends StatefulWidget {
  const Acceuilpage({super.key});

  @override
  State<Acceuilpage> createState() => _AcceuilpageState();
}

class _AcceuilpageState extends State<Acceuilpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
     // const HeaderAdmin(),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Panneau de controle",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("/image/images/ordi.png"),
                const SizedBox(
                  width: 200,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.width * 0.1,
                          //height: 00,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 5),
                                blurRadius: 3.0,
                              ),
                            ],
                          ),

                          child: GestureDetector(
                            onTap: () {
                             /* Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DocteurPage()));*/
                            },
                            child: Column(
                              children: [
                                Image.asset("/image/images/docteur.png"),
                                const Text("Docteurs")
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.width * 0.1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              // border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0, 5),
                                  blurRadius: 3.0,
                                ),
                              ],
                            ),
                            child: GestureDetector(
                              onTap: () {
                                /*Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PatientPage()));*/
                              },
                              child: Column(
                                children: [
                                  Image.asset("/image/images/patient.png"),
                                  const Text("Patients")
                                ],
                              ),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.width * 0.12,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 5),
                                blurRadius: 3.0,
                              ),
                            ],
                          ),
                          child: GestureDetector(
                            /*onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const NotificationPage()));
                            },*/
                            child: Column(
                              children: [
                                Image.asset("image/images/docteur.png"),
                                const Text("Notifications")
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.width * 0.12,

                            // height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              // border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0, 5),
                                  blurRadius: 3.0,
                                ),
                              ],
                            ),
                            child: GestureDetector(
                            /*  onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AdministrationPage()));
                              },*/
                              child: Column(
                                children: [
                                  Image.asset("/image/images/patient.png"),
                                  const Text("Administrations")
                                ],
                              ),
                            ))
                      ],
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    ]));
  }
}
