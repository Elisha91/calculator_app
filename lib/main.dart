import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorHomePage(),
      debugShowCheckedModeBanner: false, // Disable debug banner
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String _output = "0";
  String _input = "";
  String _operator = "";
  double _num1 = 0.0;
  double _num2 = 0.0;

  void _clear() {
    setState(() {
      _output = "0";
      _input = "";
      _operator = "";
      _num1 = 0.0;
      _num2 = 0.0;
    });
  }

  void _calculate() {
    setState(() {
      _num2 = double.parse(_input);
      double result;
      switch (_operator) {
        case "+":
          result = _num1 + _num2;
          break;
        case "-":
          result = _num1 - _num2;
          break;
        case "*":
          result = _num1 * _num2;
          break;
        case "/":
          result = _num1 / _num2;
          break;
        default:
          result = 0.0;
      }
      _output = result.toString();
      _input = "";
      _operator = "";
      _num1 = result;
      _num2 = 0.0;
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            setState(() {
              if (buttonText == "C") {
                _clear();
              } else if (buttonText == "=") {
                _calculate();
              } else if (buttonText == "+" ||
                  buttonText == "-" ||
                  buttonText == "*" ||
                  buttonText == "/") {
                _num1 = double.parse(_input);
                _operator = buttonText;
                _input = "";
              } else {
                _input += buttonText;
                _output = _input;
              }
            });
          },
          splashColor: Colors.orange,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(fontSize: 24.0, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      backgroundColor: Color(0xFF87CEEB), // Set the background color to sky-blue
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              child: Text(
                _output,
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: <Widget>[
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("*"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("."),
                  buildButton("0"),
                  buildButton("00"),
                  buildButton("+"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("C"),
                  buildButton("="),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
