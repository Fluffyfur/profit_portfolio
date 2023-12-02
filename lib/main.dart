import 'package:flutter/material.dart';
import 'info.dart';
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

  @override
  Widget build(BuildContext context) {
    return Consumer<InfoService>(builder: (context, infoService, child) {
      Map<String, Info> infoMap = infoService.infoMap;
      String? birthYear = infoService.birthYear;
      String? birthMonth = infoService.birthMonth;
      String? birthDate = infoService.birthDate;

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
        body: Row(
          children: [
            Flexible(
              child: TextField(
                controller: birthyearController,
                //onChanged: (value) {},
                decoration: InputDecoration(
                  labelText: 'yyyy',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Text('년')
          ],
        ),
      );
    });
  }
}
