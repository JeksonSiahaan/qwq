import 'package:flutter/material.dart';

class Pertemuan05Provider extends ChangeNotifier {
  // Status soal telah dipelajari saat?

  // Initialisasi nilai awal
  bool _diSekolah = false;
  bool _diPraktik = true;
  bool _diKursus = false;

  // Ini akan return nilai dari sekolah, dipraktik, dst. Ingat Konsep OOP setter || getter
  bool get statusSekolah => _diSekolah;
  bool get statusPraktik => _diPraktik;
  bool get statusKursus => _diKursus;

  // Perubahan State, ingat konsep Listen pada StateManajemen
  set setSekolah(val) {
    _diSekolah = val;
    notifyListeners();
  }

  set setPraktik(val) {
    _diPraktik = val;
    notifyListeners();
  }

  set setKursus(val) {
    _diKursus = val;
    notifyListeners();
  }

  // Status peminatan saat sekolah?

  // Initialisasi nilai awal
  bool _tkj = false;
  bool _rpl = false;
  bool _sma = false;

  // Ini akan return nilai dari TKJ, RPL, SMA, dst. Ingat Konsep OOP setter || getter
  bool get statusTKJ => _tkj;
  bool get statusRPL => _rpl;
  bool get statusSMA => _sma;

  // Perubahan State, ingat konsep Listen pada StateManajemen
  set setTKJ(val) {
    _tkj = val;
    notifyListeners();
  }

  set setRPL(val) {
    _rpl = val;
    notifyListeners();
  }

  set setSMA(val) {
    _sma = val;
    notifyListeners();
  }
}
