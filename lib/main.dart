import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  @override
  Widget build(BuildContext context) {
    return Consumer<InfoService>(builder: (context, infoService, child) {
      //Map<String, Info> infoMap = infoService.infoMap;
      String? birthYear = infoService.birthYear;
      String? birthMonth = infoService.birthMonth;
      String? birthDate = infoService.birthDate;
      String? name = infoService.name;

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
        body: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: nameController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[a-zA-Z]')), // 텍스트만 허용
                    ],
                    decoration: InputDecoration(
                      labelText: name != null && name.isNotEmpty ? name : '홍길동',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    String birthYear = birthyearController.text;
                    String birthMonth = birthmonthController.text;
                    String birthDate = birthdateController.text;
                    String name = nameController.text;

                    Provider.of<InfoService>(context, listen: false).createInfo(
                      birthyyyy: birthYear,
                      birthmm: birthMonth,
                      birthdd: birthDate,
                      name: name,
                    );
                  },
                  child: Text("저장"),
                )
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: TextField(
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

                    Provider.of<InfoService>(context, listen: false).createInfo(
                      birthyyyy: birthYear,
                      birthmm: birthMonth,
                      birthdd: birthDate,
                      name: name,
                    );
                  },
                  child: Text("저장"),
                )
              ],
            ),
            // 자격증 섹션
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CertificationEntryPage(),
                    ),
                  );
                },
                child: Text("자격증 추가"))
          ],
        ),
      );
    });
  }
}
