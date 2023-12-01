import 'package:flutter/material.dart';
import 'info.dart';

class InfoService extends ChangeNotifier {
  Map<String, Info> infoMap = {};

  createMemo({
    required int birthyyyy,
    required int birthmm,
    required int birthdd,
  }) {
    String key = '$birthyyyy-$birthmm-$birthdd';
    Info info = Info(
      birthyyyy: birthyyyy,
      birthmm: birthmm,
      birthdd: birthdd,
    );

    infoMap[key] = info;
    notifyListeners();
  }

  // 다른 유틸리티 메서드나 업데이트 메서드 등도 추가 가능
}
