import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import './widget/menuBar/widgetDashboard.dart';
import './widget/menuBar/widgetChart.dart';
import './widget/menuBar/widgetDeviceManagement.dart';
import './widget/menuBar/widgetSettingProfile.dart';
import './widget/menuBar/widgetLogout.dart';

import './widget/login/widgetLogin.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        'login':(context) => WidgetLogin()
      },
      home: const MyHomePage(title: 'Flutter desktop app.'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final LocalStorage storage = new LocalStorage('localstorage_app');
  // bool testing = false;  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          child: Row(
            children: [
                Container(
                  width: 250.0,
                  decoration: BoxDecoration(
                      // border: Border.all(color: Colors.blueAccent),
                      color: Colors.deepPurple[100]),
                  child: Column(
                    children: 
                    [
                      BtnDashboard(), 
                      BtnChart(),
                      BtnDeviceMangement(),
                      BtnSettingProfile(),
                      BtnLogout()
                    ]
                  ),
                )
              ]
          ),
        )
      );
  }
}
