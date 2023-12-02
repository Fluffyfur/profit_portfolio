class Info {
  Info({
    required this.birthyyyy,
    required this.birthmm,
    required this.birthdd,
  });

  String? birthyyyy;
  String? birthmm;
  String? birthdd;

  Map<String, dynamic> toMap() {
    return {
      'birthyyyy': birthyyyy,
      'birthmm': birthmm,
      'birthdd': birthdd,
    };
  }

  factory Info.fromMap(Map<String, dynamic> map) {
    return Info(
      birthyyyy: map['birthyyyy'],
      birthmm: map['birthmm'],
      birthdd: map['birthdd'],
    );
  }
}
