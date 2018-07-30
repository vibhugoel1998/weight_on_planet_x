import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  TextEditingController _takeInputController = new TextEditingController();
  int _radioValue = 0;
  String _finalText = '';
  void _calculateWeight(int value) {
    setState(() {
      _radioValue = value;
      switch (_radioValue) {
        case 0:
          int check1 = int.parse(_takeInputController.text.toString());
          if (_takeInputController.text != null && check1 > 0) {
            double check2;
            check2 = check1 * 0.06;
            _finalText = 'Your weight on Pluto is ' + check2.toStringAsFixed(1);
          }
          else
            {
              _finalText='Enter your weight in kgs';
            }
          break;
        case 1:
          int check2 = int.parse(_takeInputController.text.toString());
          if (_takeInputController.text != null && check2 > 0) {
            double check1;
            check1 = check2 * 0.38;
            _finalText = 'Your weight on Mars is ' + check1.toStringAsFixed(1);
          }
          else
          {
            _finalText='Enter your weight in kgs';
          }
          break;
        case 2:
          int check2 = int.parse(_takeInputController.text.toString());
          if (_takeInputController.text != null && check2 > 0) {
            double check1;
            check1 = check2 * 2.34;
            _finalText =
                'Your weight on Jupiter is ' + check1.toStringAsFixed(1);
          }
          else
          {
            _finalText='Enter your weight in kgs';
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.black38,
        centerTitle: true,
        title: Text(
          'Weight On Planet X',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Center(
              child: Image.asset(
            'images/planet.png',
            width: 200.0,
            height: 133.0,
          )),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 50.0, 8.0, 0.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _takeInputController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Weight On Earth',
                      labelStyle: TextStyle(fontSize: 20.0,color: Colors.white,),
                      hintText: 'Enter your weight here in kgs',
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Radio<int>(
                          value: 0,
                          activeColor: Colors.red,
                          groupValue: _radioValue,
                          onChanged: _calculateWeight,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Pluto',
                          style:
                              TextStyle(fontSize: 20.0, color: Colors.white70),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Radio<int>(
                            value: 1,
                            activeColor: Colors.pink,
                            groupValue: _radioValue,
                            onChanged: _calculateWeight),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Mars',
                          style:
                              TextStyle(fontSize: 20.0, color: Colors.white70),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Radio<int>(
                            value: 2,
                            activeColor: Colors.amber,
                            groupValue: _radioValue,
                            onChanged: _calculateWeight),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Jupiter',
                          style:
                              TextStyle(fontSize: 20.0, color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Text(
              _finalText,
              style: TextStyle(fontSize: 30.0, color: Colors.white),
            ),
          ))
        ],
      ),
    );
  }
}
