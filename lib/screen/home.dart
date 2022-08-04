import 'package:flutter/material.dart';

class calculator extends StatefulWidget {
  const calculator({Key? key}) : super(key: key);

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String oper = "";

  buttonpressed(String buttonText) {
    if (buttonText == "clear") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      oper = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "*") {
      num1 = double.parse(output);
      oper = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("alraedy containa decimal");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (oper == "+") {
        _output = (num1 + num2).toString();
      }
      if (oper == "-") {
        _output = (num1 - num2).toString();
      }
      if (oper == "*") {
        _output = (num1 * num2).toString();
      }
      if (oper == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0;
      num2 = 0;
      oper = "";
    } else {
      _output = _output + buttonText;
    }
    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buidbutton(String buttonText) {
    return Expanded(
      
      child: ButtonBar(
        
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        onPressed: () => buttonpressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator'), backgroundColor: Colors.black),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 23,
                horizontal: 12,
              ),
              alignment: Alignment.centerRight,
              child: Text(
                output,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: [
                Row(
                  children: [
                    buidbutton('7'),
                    buidbutton('8'),
                    buidbutton('9'),
                    buidbutton('/'),
                  ],
                ),
                Row(
                  children: [
                    buidbutton('4'),
                    buidbutton('5'),
                    buidbutton('6'),
                    buidbutton('*'),
                  ],
                ),
                Row(
                  children: [
                    buidbutton('1'),
                    buidbutton('2'),
                    buidbutton('3'),
                    buidbutton('-'),
                  ],
                ),
                Row(
                  children: [
                    buidbutton('00'),
                    buidbutton('0'),
                    buidbutton('.'),
                    buidbutton('+'),
                  ],
                ),
                Row(
                  children: [
                    buidbutton('clear'),
                    buidbutton('='),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
