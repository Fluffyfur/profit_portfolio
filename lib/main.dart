import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profit_portfolio_ver2/info.dart';
//import 'info.dart';
import 'certification_entry.dart';
import 'info_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => InfoService(),
        )
      ],
      child: MyApp(),
    ),
  );
}

//
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProFit PortFolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResumeForm(),
    );
  }
}

//
class ResumeForm extends StatefulWidget {
  @override
  _ResumeFormState createState() => _ResumeFormState();
}

class _ResumeFormState extends State<ResumeForm> {
  final TextEditingController birthyearController = TextEditingController();
  final TextEditingController birthmonthController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<InfoService>(builder: (context, infoService, child) {
      //Map<String, Info> infoMap = infoService.infoMap;
      String? birthYear = infoService.birthYear;
      String? birthMonth = infoService.birthMonth;
      String? birthDate = infoService.birthDate;
      String? name = infoService.name;
      String? gender = infoService.gender;
      List<Certification> certifications = infoService.certifications;
      int? certificationcount = certifications.length;

      return Scaffold(
        appBar: AppBar(
          title: Text(
            '내 이력서 만들기',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(width: 70, child: Text("성명")),
                    SizedBox(width: 15),
                    Flexible(
                      child: TextField(
                        controller: nameController,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp('[ㄱ-ㅎ가-힣]')), // 텍스트만 허용
                        ],
                        decoration: InputDecoration(
                          labelText:
                              name != null && name.isNotEmpty ? name : '홍길동',
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        String birthYear = birthyearController.text;
                        String birthMonth = birthmonthController.text;
                        String birthDate = birthdateController.text;
                        String name = nameController.text;
                        String gender = genderController.text;

                        Provider.of<InfoService>(context, listen: false)
                            .createInfo(
                          birthyyyy: birthYear,
                          birthmm: birthMonth,
                          birthdd: birthDate,
                          name: name,
                          gender: gender,
                        );
                      },
                      child: Text("저장"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text("성별"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(width: 70, child: Text("생년월일")),
                    SizedBox(width: 15),
                    Flexible(
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        controller: birthyearController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                        ],
                        //onChanged: (value) {},
                        decoration: InputDecoration(
                          labelText: birthYear != null && birthYear.isNotEmpty
                              ? birthYear
                              : 'YYYY',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Text('년'),
                    Flexible(
                      child: TextField(
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(2),
                        ],
                        keyboardType: TextInputType.number,
                        controller: birthmonthController,
                        //onChanged: (value) {},
                        decoration: InputDecoration(
                          labelText: birthMonth != null && birthMonth.isNotEmpty
                              ? birthMonth
                              : 'MM',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Text('월'),
                    Flexible(
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(2),
                        ],
                        keyboardType: TextInputType.number,
                        controller: birthdateController,
                        //onChanged: (value) {},
                        decoration: InputDecoration(
                          labelText: birthDate != null && birthDate.isNotEmpty
                              ? birthDate
                              : 'DD',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Text('일'),
                    TextButton(
                      onPressed: () {
                        String birthYear = birthyearController.text;
                        String birthMonth = birthmonthController.text;
                        String birthDate = birthdateController.text;
                        String name = nameController.text;
                        String gender = genderController.text;

                        Provider.of<InfoService>(context, listen: false)
                            .createInfo(
                          birthyyyy: birthYear,
                          birthmm: birthMonth,
                          birthdd: birthDate,
                          name: name,
                          gender: gender,
                        );
                      },
                      child: Text("저장"),
                    )
                  ],
                ),
                // 자격증 섹션
                certifications.isEmpty
                    ? Container(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(width: 70, child: Text("자격 항목")),
                            SizedBox(
                              width: 15,
                            ),
                            Spacer(),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CertificationEntryPage(),
                                    ),
                                  );
                                },
                                child: Text("자격증 추가하기")),
                            Spacer(),
                          ],
                        ),
                      )
                    : Container(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(width: 70, child: Text("자격 항목")),
                            Spacer(),
                            Text("자격증 등록 완료($certificationcount개)"),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CertificationEntryPage(),
                                    ),
                                  );
                                },
                                child: Text("수정하기")),
                            Spacer(),
                          ],
                        ),
                      )
              ],
            ),
          ),
        ),
      );
    });
  }
}
