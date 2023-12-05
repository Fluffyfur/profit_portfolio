import 'package:flutter/material.dart';
import 'info.dart';

class InfoService extends ChangeNotifier {
  Map<String, Info> infoMap = {};
  String? birthYear;
  String? birthMonth;
  String? birthDate;
  String? name;
  List<Certification> certifications = []; // 자격증 정보를 담을 리스트 추가

  addCertification(Certification certification) {
    certifications.add(certification);
    notifyListeners();
  }

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
      certifications: List.from(certifications), // 자격증 정보 복사
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
