import 'package:flutter/material.dart';
import 'info.dart';

class InfoService extends ChangeNotifier {
  List<Info> infoList = [];

  createMemo({
    required int birthyyyy,
    required int birthmm,
    required int birthdd,
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