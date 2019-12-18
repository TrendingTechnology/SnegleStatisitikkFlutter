import 'package:flutter/material.dart';
import 'package:slugflutter/database/controllers/localDBcontroller.dart';
import 'package:slugflutter/ui/pages/main.dart';
import 'package:slugflutter/ui/themes/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({ Key key}) : super (key: key);

  @override
  _MyAppState createState() => _MyAppState();
  
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Slug stat app',
      home: Scaffold(
        backgroundColor: CustomTheme.getTheme.backgroundColor,
        body: MainPage()
      ),
    );
  }
}
