import 'package:flutter/material.dart';
import 'info.dart';

class InfoService extends ChangeNotifier {
  List<Info> infoList = [];

  createMemo({
    required String birthdate,
  }) {
    Info info = Info(
      birthdate: birthdate,
    );
    infoList.add(info);
    notifyListeners();
  }
} 
//
