import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Calculator(),
  ));
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int _count = 1;

  double _current = 0.0;
  double _firstResult = 0.0;
  double _secondResult = 0.0;
  double _savedResult = 0.0;

  String _signNow = "";

  bool _isSaved = false;
  bool _isPointClicked = false;

  @override
  Widget build(BuildContext context) {
    // Modify Width & Height

    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidthHeightRate = deviceHeight / deviceWidth;
    final double buttonHorizontalMargin = deviceWidth * 0.2 / 5;
    final double buttonWidth = deviceWidth * 0.8 / 4;
    final double displayDivHeight = deviceHeight * 0.3;
    final double displayTopPadding = displayDivHeight * 0.7;
    final double textFieldHeight = displayDivHeight * 0.3;
    final double textFontSize = displayDivHeight * 0.3;
    final double buttonDivHeight = deviceHeight * 0.45;
    final double buttonTextFontSize = buttonDivHeight / 9;
    final double buttonVerticalMargin = deviceHeight * 0.2 / 5;
    final double buttonHeight = buttonDivHeight / 5;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(50, 50, 50, 1),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: displayDivHeight,
              width: deviceWidth,
              child: Padding(
                padding: EdgeInsets.only(
                    top: displayTopPadding,
                    right: buttonHorizontalMargin,
                    left: buttonHorizontalMargin),
                child: Text(
                  (_current.toInt() < _current &&
                          _current < _current.toInt() + 1)
                      ? _current.toString()
                      : _current.toInt().toString(),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: textFontSize,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: buttonVerticalMargin),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () => _inputSign("C"),
                  style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: Size(buttonWidth, buttonHeight),
                    shape: const CircleBorder(),
                  ),
                  child: Text(
                    "C",
                    style: TextStyle(
                      fontSize: buttonTextFontSize,
                    ),
                  ),
                ),
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () => _inputSign("S"),
                  style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: Size(buttonWidth, buttonHeight),
                    shape: const CircleBorder(),
                  ),
                  child: Text(
                    "S",
                    style: TextStyle(
                      fontSize: buttonTextFontSize,
                    ),
                  ),
                ),
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () => _inputSign("%"),
                  style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: Size(buttonWidth, buttonHeight),
                    shape: const CircleBorder(),
                  ),
                  child: Text(
                    "%",
                    style: TextStyle(
                      fontSize: buttonTextFontSize,
                    ),
                  ),
                ),
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () => _deleteNumber(),
                  style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: Size(buttonWidth, buttonHeight),
                    shape: const CircleBorder(),
                  ),
                  child: Text(
                    "→",
                    style: TextStyle(
                      fontSize: buttonTextFontSize,
                    ),
                  ),
                ),
                SizedBox(width: buttonHorizontalMargin),
              ],
            ),
            SizedBox(height: buttonVerticalMargin),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () => _inputNumber(7),
                  style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: Size(buttonWidth, buttonHeight),
                    shape: const CircleBorder(),
                  ),
                  child: Text(
                    "7",
                    style: TextStyle(
                      fontSize: buttonTextFontSize,
                    ),
                  ),
                ),
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () => _inputNumber(8),
                  style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: Size(buttonWidth, buttonHeight),
                    shape: const CircleBorder(),
                  ),
                  child: Text(
                    "8",
                    style: TextStyle(
                      fontSize: buttonTextFontSize,
                    ),
                  ),
                ),
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () => _inputNumber(9),
                  style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: Size(buttonWidth, buttonHeight),
                    shape: const CircleBorder(),
                  ),
                  child: Text(
                    "9",
                    style: TextStyle(
                      fontSize: buttonTextFontSize,
                    ),
                  ),
                ),
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () => _inputSign("÷"),
                  style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: Size(buttonWidth, buttonHeight),
                    shape: const CircleBorder(),
                  ),
                  child: Text(
                    "÷",
                    style: TextStyle(
                      fontSize: buttonTextFontSize,
                    ),
                  ),
                ),
                SizedBox(width: buttonHorizontalMargin),
              ],
            ),
            SizedBox(height: buttonVerticalMargin),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () => _inputNumber(4),
                  style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: Size(buttonWidth, buttonHeight),
                    shape: const CircleBorder(),
                  ),
                  child: Text(
                    "4",
                    style: TextStyle(
                      fontSize: buttonTextFontSize,
                    ),
                  ),
                ),
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () => _inputNumber(5),
                  style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: Size(buttonWidth, buttonHeight),
                    shape: const CircleBorder(),
                  ),
                  child: Text(
                    "5",
                    style: TextStyle(
                      fontSize: buttonTextFontSize,
                    ),
                  ),
                ),
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () => _inputNumber(6),
                  style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: Size(buttonWidth, buttonHeight),
                    shape: const CircleBorder(),
                  ),
                  child: Text(
                    "6",
                    style: TextStyle(
                      fontSize: buttonTextFontSize,
                    ),
                  ),
                ),
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () => _inputSign("x"),
                  style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: Size(buttonWidth, buttonHeight),
                    shape: const CircleBorder(),
                  ),
                  child: Text(
                    "x",
                    style: TextStyle(
                      fontSize: buttonTextFontSize,
                    ),
                  ),
                ),
                SizedBox(width: buttonHorizontalMargin),
              ],
            ),
            SizedBox(height: buttonVerticalMargin),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () => _inputNumber(1),
                  style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: Size(buttonWidth, buttonHeight),
                    shape: const CircleBorder(),
                  ),
                  child: Text(
                    "1",
                    style: TextStyle(
                      fontSize: buttonTextFontSize,
                    ),
                  ),
                ),
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () => _inputNumber(2),
                  style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: Size(buttonWidth, buttonHeight),
                    shape: const CircleBorder(),
                  ),
                  child: Text(
                    "2",
                    style: TextStyle(
                      fontSize: buttonTextFontSize,
                    ),
                  ),
                ),
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () => _inputNumber(3),
                  style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: Size(buttonWidth, buttonHeight),
                    shape: const CircleBorder(),
                  ),
                  child: Text(
                    "3",
                    style: TextStyle(
                      fontSize: buttonTextFontSize,
                    ),
                  ),
                ),
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () => _inputSign("-"),
                  style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: Size(buttonWidth, buttonHeight),
                    shape: const CircleBorder(),
                  ),
                  child: Text(
                    "-",
                    style: TextStyle(
                      fontSize: buttonTextFontSize,
                    ),
                  ),
                ),
                SizedBox(width: buttonHorizontalMargin),
              ],
            ),
            SizedBox(height: buttonVerticalMargin),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () => _inputNumber(0),
                  style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: Size(buttonWidth, buttonHeight),
                    shape: const CircleBorder(),
                  ),
                  child: Text(
                    "0",
                    style: TextStyle(
                      fontSize: buttonTextFontSize,
                    ),
                  ),
                ),
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () => _inputSign("."),
                  style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: Size(buttonWidth, buttonHeight),
                    shape: const CircleBorder(),
                  ),
                  child: Text(
                    ".",
                    style: TextStyle(
                      fontSize: buttonTextFontSize,
                    ),
                  ),
                ),
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () => _inputSign("="),
                  style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: Size(buttonWidth, buttonHeight),
                    shape: const CircleBorder(),
                  ),
                  child: Text(
                    "=",
                    style: TextStyle(
                      fontSize: buttonTextFontSize,
                    ),
                  ),
                ),
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () => _inputSign("+"),
                  style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: Size(buttonWidth, buttonHeight),
                    shape: const CircleBorder(),
                  ),
                  child: Text(
                    "+",
                    style: TextStyle(
                      fontSize: buttonTextFontSize,
                    ),
                  ),
                ),
                SizedBox(width: buttonHorizontalMargin),
              ],
            ),
            SizedBox(height: deviceHeight * 0.05),
          ],
        ),
      ),
    );
  }

  void _inputNumber(int number) {
    setState(() {
      if (!_isSaved) {
        _current = _current * 10 + number;
      } else {
        _current = _current + number / pow(10, _count);
        _count++;
      }
    });
  }

  void _inputSign(String sign) {
    setState(() {
      switch (sign) {
        case "C":
          _current = 0;
          _firstResult = 0;
          _secondResult = 0;
          _isSaved = false;
          break;

        case "S":
          if (!_isSaved) {
            _savedResult = _current;
            _current = 0;
            _isSaved = true;
          } else {
            _current = _savedResult;
            _isSaved = false;
          }
          _isSaved = false;
          break;

        case "%":
          // Should Modify "_current"'s type
          // int to double
          _current = _current / 100;
          _isSaved = false;
          break;

        case "÷":
          _firstResult = _current;
          _current = 0;
          _signNow = "÷";
          _isSaved = false;
          break;

        case "x":
          _firstResult = _current;
          _current = 0;
          _signNow = "x";
          _isSaved = false;
          break;

        case "-":
          _firstResult = _current;
          _current = 0;
          _signNow = "-";
          _isSaved = false;
          break;

        case "+":
          _firstResult = _current;
          _current = 0;
          _signNow = "+";
          _isSaved = false;
          break;

        case ".":
          if (!_isSaved) {
            _isSaved = true;
          } else {
            _isSaved = false;
          }
          break;

        case "=":
          _secondResult = _current;

          switch (_signNow) {
            case "÷":
              _current = _firstResult / _secondResult;
              break;

            case "x":
              _current = _firstResult * _secondResult;
              break;

            case "-":
              _current = _firstResult - _secondResult;
              break;

            case "+":
              _current = _firstResult + _secondResult;
              break;
          }

          _isSaved = false;
      }
    });
  }

  void _deleteNumber() {
    setState(() {
      _current = _current / 10;
    });
  }
}
