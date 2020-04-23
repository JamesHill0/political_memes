import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'loadingPage.dart';
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
          return MemeList();
        },
      ),
    );
  }

  void getOrientation() async {
    int orientation = await (_read());
    if (orientation == 1) {
      loadingPage();
    } else if (orientation == -1) {
      loadingPage();
    } else {
      print("You havn't chosen yet");
    }
  }

  @override
  void initState() {
    super.initState();
    getOrientation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            onTap: () {
              _savePoliticalOrientation(-1);
              _read();
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
              _savePoliticalOrientation(1);
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

_savePoliticalOrientation(orientation) async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'politics';
  final value = orientation;
  prefs.setInt(key, value);
}

Future<int> _read() async {
  final prefs = await SharedPreferences.getInstance();

  final key = 'politics';
  final value = prefs.getInt(key) ?? 0;
  if (value == 1) {
    print("You are a democrat");
  } else if (value == -1) {
    print("You are a republican");
  } else {
    print("You havn't chosen yet");
  }
  return value;
}
