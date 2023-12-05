class Info {
  Info({
    required this.birthyyyy,
    required this.birthmm,
    required this.birthdd,
    required this.name,
    required this.certifications,
  });

  String? birthyyyy;
  String? birthmm;
  String? birthdd;
  String? name;
  List<Certification> certifications;

  Map<String, dynamic> toMap() {
    return {
      'birthyyyy': birthyyyy,
      'birthmm': birthmm,
      'birthdd': birthdd,
      'name': name,
      'certifications':
          certifications.map((certification) => certification.toMap()).toList(),
    };
  }

  factory Info.fromMap(Map<String, dynamic> map) {
    return Info(
      birthyyyy: map['birthyyyy'],
      birthmm: map['birthmm'],
      birthdd: map['birthdd'],
      name: map['name'],
      certifications: List<Certification>.from(
        (map['certifications'] as List<dynamic>).map(
          (certificationMap) => Certification.fromMap(certificationMap),
        ),
      ),
    );
  }
}

class Certification {
  Certification({
    required this.certificationName,
    required this.acquisitionDate,
    required this.organizer,
  });

  String certificationName;
  String acquisitionDate;
  String organizer;

  Map<String, dynamic> toMap() {
    return {
      'certificationName': certificationName,
      'acquisitionDate': acquisitionDate,
      'organizer': organizer,
    };
  }

  factory Certification.fromMap(Map<String, dynamic> map) {
    return Certification(
      certificationName: map['certificationName'],
      acquisitionDate: map['acquisitionDate'],
      organizer: map['organizer'],
    );
  }
}
