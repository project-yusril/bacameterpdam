class GambarMeter{

  int _id;
  String _foto;
  String _nomorpelanggan;

  GambarMeter(this._foto, this._nomorpelanggan);
  GambarMeter.id(this._id, this._foto, this._nomorpelanggan);

  int get id {
    return _id;
  }

  String get foto {
    return _foto;
  }

  String get nomorpelanggan{
    return _nomorpelanggan;
  }

  set foto(String ambilfoto){
    this._foto= ambilfoto;
  }

  set nomorpelanggan(String ambilnomorpelanggan) {
    this._nomorpelanggan= ambilnomorpelanggan;
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();

    map['id'] = _id;
    map['foto'] = _foto;
    map['nomorpelanggan'] = _nomorpelanggan;

    return map;
  }

  GambarMeter.fromMapObject(Map<String, dynamic> map) {
    this._id=map['id'];
    this._foto=map['foto'];
    this._nomorpelanggan=map['nomorpelanggan'];
  }
}