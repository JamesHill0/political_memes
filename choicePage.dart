import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'scripts/redditApi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChoicePage extends StatefulWidget {
  @override
  _ChoicePageState createState() => _ChoicePageState();
}

class _ChoicePageState extends State<ChoicePage> {
  void loadingPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LoadingScreen();
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            onTap: () {
//              _save();
//              _read();
              loadingPage();
            },
            child: Container(
              color: Colors.red,
              child: Image.asset('images/elephant.png'),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              width: double.infinity,
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              _save();
              _read();
              loadingPage();
            },
            child: Container(
              color: Colors.blue,
              child: Image.asset('images/donkey.png'),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              width: double.infinity,
            ),
          ),
        ),
      ],
    );
  }
}

_save() async {
  print("HELLO");
  final prefs = await SharedPreferences.getInstance();
  final key = 'my_int_key';
  final value = 42;
  prefs.setInt(key, value);
  print('saved $value');
}

_read() async {
  final prefs = await SharedPreferences.getInstance();
  print("IS IT ME YOU ARE LOOKING FOR");

  final key = 'my_int_key';
  final value = prefs.getInt(key) ?? 0;
  print('read: $value');
}
