class Investisseur {
  int? _idInv;
  String? _nomPrenom;
  String? _email;
  int? _telephone;
  String? _residense;
  String? _image;
  String? _passWord;
  String? _passWordConfirm;

  investisseur(
      {int? idInv,
        String? nomPrenom,
        String? email,
        int? telephone,
        String? residense,
        String? image,
        String? passWord,
        String? passWordConfirm}) {
    if (idInv != null) {
      this._idInv = idInv;
    }
    if (nomPrenom != null) {
      this._nomPrenom = nomPrenom;
    }
    if (email != null) {
      this._email = email;
    }
    if (telephone != null) {
      this._telephone = telephone;
    }
    if (residense != null) {
      this._residense = residense;
    }
    if (image != null) {
      this._image = image;
    }
    if (passWord != null) {
      this._passWord = passWord;
    }
    if (passWordConfirm != null) {
      this._passWordConfirm = passWordConfirm;
    }
  }

  int? get idInv => _idInv;
  set idInv(int? idInv) => _idInv = idInv;
  String? get nomPrenom => _nomPrenom;
  set nomPrenom(String? nomPrenom) => _nomPrenom = nomPrenom;
  String? get email => _email;
  set email(String? email) => _email = email;
  int? get telephone => _telephone;
  set telephone(int? telephone) => _telephone = telephone;
  String? get residense => _residense;
  set residense(String? residense) => _residense = residense;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get passWord => _passWord;
  set passWord(String? passWord) => _passWord = passWord;
  String? get passWordConfirm => _passWordConfirm;
  set passWordConfirm(String? passWordConfirm) =>
      _passWordConfirm = passWordConfirm;

  Investisseur.fromJson(Map<String, dynamic> json) {
    _idInv = json['idInv'];
    _nomPrenom = json['nomPrenom'];
    _email = json['email'];
    _telephone = json['telephone'];
    _residense = json['residense'];
    _image = json['image'];
    _passWord = json['passWord'];
    _passWordConfirm = json['passWordConfirm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idInv'] = this._idInv;
    data['nomPrenom'] = this._nomPrenom;
    data['email'] = this._email;
    data['telephone'] = this._telephone;
    data['residense'] = this._residense;
    data['image'] = this._image;
    data['passWord'] = this._passWord;
    data['passWordConfirm'] = this._passWordConfirm;
    return data;
  }
}
