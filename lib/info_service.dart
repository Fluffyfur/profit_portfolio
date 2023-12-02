import 'package:flutter/material.dart';
import 'info.dart';

class InfoService extends ChangeNotifier {
  Map<String, Info> infoMap = {};
  String? birthYear;
  String? birthMonth;
  String? birthDate;

  createMemo({
    required String birthyyyy,
    required String birthmm,
    required String birthdd,
  }) {
    String key = '$birthyyyy-$birthmm-$birthdd';
    Info info = Info(
      birthyyyy: birthyyyy,
      birthmm: birthmm,
      birthdd: birthdd,
    );

    infoMap[key] = info;
    birthYear = birthyyyy;
    birthMonth = birthmm;
    birthDate = birthdd;
    // 출생 연도를 별도로 설정
    notifyListeners();
    notifyListeners();
  }

  // 다른 유틸리티 메서드나 업데이트 메서드 등도 추가쌉가능
}
