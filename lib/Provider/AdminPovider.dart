
import 'package:dashboard_agroinvest/Modele/AdminModel.dart';
import 'package:dashboard_agroinvest/Modele/AgriculteurModele.dart';
import 'package:dashboard_agroinvest/Modele/AjouterCreditmodel.dart';
import 'package:dashboard_agroinvest/Modele/AjouterOffremodel.dart';
import 'package:dashboard_agroinvest/Modele/Investisseur.dart';
import 'package:flutter/foundation.dart';

class AdminProvider with ChangeNotifier {
  Admin? _admin;
  int? _idAd;
  //String? _nomPrenom;

  Admin? get admin => _admin;
  int? get idAd => _idAd;
 // String? get nomPrenom => _nomPrenom;
int _currentIndex = 0;

Credit creditEnCours = Credit();
Offre offreSelect = Offre();
Investisseur investisseurSelect= Investisseur();
Agriculteur agriculteurSelect = Agriculteur();


  int get currentIndex => _currentIndex;
  void setCurrentIndex(int currentIndex){
    _currentIndex = currentIndex;
    notifyListeners();
  }
  void setAdmin(Admin admin) {
    _admin = admin;
    notifyListeners();
  }

  void setIdAd(int IdAd) {
    _idAd = _idAd;
    notifyListeners();
  }

  void clearAdmin() {
    _admin = null;
    _idAd = null;
    notifyListeners();
  }
}
