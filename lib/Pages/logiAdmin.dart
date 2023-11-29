import 'package:dashboard_agroinvest/Pages/Acceuilpage.dart';
import 'package:dashboard_agroinvest/Provider/AdminPovider.dart';
import 'package:dashboard_agroinvest/Service/AdminService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginAdmin extends StatefulWidget {
  const LoginAdmin({Key? key}) : super(key: key);

  @override
  State<LoginAdmin> createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passWordController = TextEditingController();
  AdminService _adminService = AdminService();
  bool nonVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            children: [
              Icon(Icons.admin_panel_settings, size: 50),
              Center(child: Text("Login Admin"))
            ],
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  child: Image.asset("asset/images/logo.png"), height: 200),
              SizedBox(height: 20,),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 450),
                        child: TextFormField(
                          onTapOutside: (e) =>FocusScope.of(context).unfocus(),
                          //obscureText: true,
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez saisir une adresse e-mail.';
                            }
                            // Utilisation d'une expression régulière pour vérifier une adresse e-mail simple
                            if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
                              return 'Veuillez saisir une adresse e-mail valide.';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 20),
                            labelText: "Adresse Email",
                            border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            prefixIcon:
                            Icon(Icons.person, color: Color(0xA8008000)),
                          ),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 450.0),
                        child: TextFormField(
                          obscureText: !nonVisible,
                          controller: _passWordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veillez saisir votre mot de passe !';
                            }if(value.length<=7){
                              return "Le mot de passe doit conténir au moins 8 caractère";
                            }else{
                              return null;}
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 20),
                              labelText: "Mot de Passe",
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                              ),
                              prefixIcon:
                              Icon(Icons.lock, color: Color(0xA8008000)),
                              suffixIcon: IconButton(
                                onPressed: (){
                                  setState(() {
                                    nonVisible=!nonVisible;
                                  });
                                },
                                icon: Icon(
                                    nonVisible==true?Icons.visibility_off:Icons.visibility
                                ),
                              )
                          ),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 170, vertical: 20),
                            backgroundColor: Color(0xA8008000),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            // Si le formulaire est valide, effectuer la requête API
                            try {
                              final email = _emailController.text;
                              final password = _passWordController.text;


                              final success = await _adminService.loginAdmin(email, password);

                              if (success!=null) {
                                //effacer l'ancien donné s'il existe
                                Provider.of<AdminProvider>(context, listen: false).clearAdmin();

                                //stocker les nouvvelle donné
                                print(success);
                              //  Provider.of<AdminProvider>(context, listen: false).setAdmin(success);
                                Provider.of<AdminProvider>(context, listen: false).setAdmin(success);
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Accueille()));
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Center(child: Text("Connecté avec succès en tant qu'administrateur",))));
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Center(child: Text("adress email ou mot de passe incorrect"))));
                              }
                            } catch (e) {
                              // gestion des erreurs de la requête API
                              print('Erreur API: $e');
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Une erreur s'est produit lors de la connection")));
                            }
                          }
                        },
                        child: Text(
                          "Se Connecter",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
