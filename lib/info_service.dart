import 'package:flutter/material.dart';
import 'info.dart';

class InfoService extends ChangeNotifier {
  Map<String, Info> infoMap = {};
  String? birthYear;
  String? birthMonth;
  String? birthDate;
  String? name;

  createInfo({
    required String birthyyyy,
    required String birthmm,
    required String birthdd,
    required String name,
  }) {
    String key = '$birthyyyy-$birthmm-$birthdd-$name';
    Info info = Info(
      birthyyyy: birthyyyy,
      birthmm: birthmm,
      birthdd: birthdd,
      name: name,
    );

    infoMap[key] = info;
    birthYear = birthyyyy;
    birthMonth = birthmm;
    birthDate = birthdd;
    name = name;
    notifyListeners();
  }

  // 다른 유틸리티 메서드나 업데이트 메서드 등도 추가쌉가능
}
