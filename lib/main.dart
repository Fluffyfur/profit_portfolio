import 'package:flutter/material.dart';
import 'package:profit_portfolio_ver2/info_service.dart';
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
  @override
  Widget build(BuildContext context) {
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
          Container(
            width: double.infinity,
            child: Row(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: "YYYY",
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Text("년"),
                TextField(
                  decoration: InputDecoration(
                    labelText: "MM",
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Text("월"),
                TextField(
                  decoration: InputDecoration(
                    labelText: "DD",
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Text("일"),
                TextButton(onPressed: () {}, child: Text('저장'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
