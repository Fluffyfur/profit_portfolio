class Info {
  Info({
    required this.birthyyyy,
    required this.birthmm,
    required this.birthdd,
    required this.name,
  });

  String? birthyyyy;
  String? birthmm;
  String? birthdd;
  String? name;

  Map<String, dynamic> toMap() {
    return {
      'birthyyyy': birthyyyy,
      'birthmm': birthmm,
      'birthdd': birthdd,
      'name': name,
    };
  }

  factory Info.fromMap(Map<String, dynamic> map) {
    return Info(
      birthyyyy: map['birthyyyy'],
      birthmm: map['birthmm'],
      birthdd: map['birthdd'],
      name: map['name'],
    );
  }
}
