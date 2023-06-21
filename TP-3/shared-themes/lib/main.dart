import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: _themeData,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(    
              title: Text('SharedPreferences'),
              centerTitle: true,
            ),
            body: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                  //_theme = 'Light';
                      _setSelectedTheme('Light');
                    },
                    child: Text("Light")),
                ElevatedButton(
                    onPressed: () {
                //_theme = 'Dark';
                      _setSelectedTheme('Dark');
                    },
                    child: Text("Dark"))
              ],
            )));
  }

  String _theme = 'Light';
  var _themeData = ThemeData.light();
  @override
  void initState() {
    super.initState();
    _loadSelectedTheme();
  }

  _loadSelectedTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _theme = (prefs.getString('theme') ?? 'Light');
      _themeData = _theme == 'Dark' ? ThemeData.dark() : ThemeData.light();
    });
  }

  _setSelectedTheme(theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _theme = theme;
      _themeData = theme == 'Dark' ? ThemeData.dark() : ThemeData.light();
      prefs.setString('theme', theme);
    });
  }
}
