class Kullanici {

  final String uid;
  bool kayitVarmi;
  String isim;
  String sIsim;
  String adres;
  String binaNu;
  String sehir;
  String bolge;
  String pKodu;
  String isAdi;

  Kullanici({ this.uid, this.isim, this.sIsim, this.adres, this.sehir, this.kayitVarmi, this.binaNu, this.pKodu, this.bolge});

  void setKayit(bool kayitVarmi){
    this.kayitVarmi = kayitVarmi;
  }

  void setIsim(String isim, String sIsim){
    this.isim = isim;
    this.sIsim = sIsim;
  }

  void setAdres(String adres, String binaNu, String sehir, String bolge, String pKodu){
    this.adres = adres;
    this.binaNu = binaNu;
    this.sehir = sehir;
    this.bolge = bolge;
    this.pKodu = pKodu;
  }

  void setIsAdi(String isAdi){
    this.isAdi = isAdi;
  }
}