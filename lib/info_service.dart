import 'package:flutter/material.dart';
import 'info.dart';

class InfoService extends ChangeNotifier {
  List<Info> infoList = [];

  createMemo({
    required String birthyyyy,
    required String birthmm,
    required String birthdd,
  }) {
    Info info = Info(
      birthyyyy: birthyyyy,
      birthmm: birthmm,
      birthdd: birthdd,
    );
    infoList.add(info);
    notifyListeners();
  }
} 
//