import 'package:flutter/material.dart';
import 'info.dart';

class InfoService extends ChangeNotifier {
  Map<String, Info> infoMap = {};

  createMemo({
    required String birthyyyy,
    required String birthmm,
    required String birthdd,
  }) {
    String key = "$birthyyyy$birthmm$birthdd";
    Info info = Info(
      birthyyyy: birthyyyy,
      birthmm: birthmm,
      birthdd: birthdd,
    );
    infoMap[key] = info;
    notifyListeners();
  }
}
