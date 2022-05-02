import 'package:flutter/material.dart';

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
  int _countForInput = 1;
  int _varForTenInput = 1;
  int _varForTenDelete = 1;
  int _currentToSplitLength = 0;

  double _numberToDouble = 0.0;
  double _current = 0.0;
  double _firstResult = 0.0;
  double _secondResult = 0.0;
  double _savedResult = 0.0;

  String _signNow = "";

  bool _isSaved = false;
  bool _isPointClicked = false;
  bool _isArithmeticError = false;
  bool _isOver = false;

  List<String> _currentToSplit = [];

  @override
  Widget build(BuildContext context) {
    // Modify Width & Height

    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double buttonHorizontalMargin = deviceWidth * 0.2 / 5;
    final double buttonWidth = deviceWidth * 0.8 / 4;
    final double displayDivHeight = deviceHeight * 0.3;
    final double displayTopPadding = displayDivHeight * 0.7;
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
                  // Should be modified
                  _isArithmeticError
                      ? "Error"
                      : (_isOver)
                          ? "OVER!"
                          : (_current.toInt() < _current &&
                                  _current < _current.toInt() + 1)
                              ? _current.toString()
                              : _isPointClicked
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
                    primary: const Color.fromRGBO(253, 150, 14, 1),
                  ),
                  child: Text(
                    "C",
                    style: TextStyle(
                      fontSize: buttonTextFontSize,
                      color: const Color.fromRGBO(0, 59, 74, 1),
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
                    primary: _isSaved
                        ? const Color.fromRGBO(150, 100, 150, 1)
                        : const Color.fromRGBO(253, 150, 14, 1),
                  ),
                  child: Text(
                    "S",
                    style: TextStyle(
                      fontSize: buttonTextFontSize,
                      color: const Color.fromRGBO(0, 59, 74, 1),
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
                    primary: const Color.fromRGBO(253, 150, 14, 1),
                  ),
                  child: Text(
                    "%",
                    style: TextStyle(
                      fontSize: buttonTextFontSize,
                      color: const Color.fromRGBO(0, 59, 74, 1),
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
                    primary: const Color.fromRGBO(253, 150, 14, 1),
                  ),
                  child: Text(
                    "→",
                    style: TextStyle(
                      fontSize: buttonTextFontSize,
                      color: const Color.fromRGBO(0, 59, 74, 1),
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
                    primary: const Color.fromRGBO(130, 130, 130, 1),
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
                    primary: const Color.fromRGBO(130, 130, 130, 1),
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
                    primary: const Color.fromRGBO(130, 130, 130, 1),
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
                    primary: const Color.fromRGBO(39, 104, 210, 1),
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
                    primary: const Color.fromRGBO(130, 130, 130, 1),
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
                    primary: const Color.fromRGBO(130, 130, 130, 1),
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
                    primary: const Color.fromRGBO(130, 130, 130, 1),
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
                    primary: const Color.fromRGBO(39, 104, 210, 1),
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
                    primary: const Color.fromRGBO(130, 130, 130, 1),
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
                    primary: const Color.fromRGBO(130, 130, 130, 1),
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
                    primary: const Color.fromRGBO(130, 130, 130, 1),
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
                    primary: const Color.fromRGBO(39, 104, 210, 1),
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
                    primary: const Color.fromRGBO(130, 130, 130, 1),
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
                    primary: _isPointClicked
                        ? const Color.fromRGBO(130, 100, 210, 1)
                        : const Color.fromRGBO(39, 104, 210, 1),
                    // If "." button is clicked, change background color to check
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
                    primary: const Color.fromRGBO(39, 104, 210, 1),
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
                    primary: const Color.fromRGBO(39, 104, 210, 1),
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

  void _calculateCurrentToSplitLength() {
    _currentToSplit = _current.toString().split('.');
    _currentToSplitLength = _currentToSplit[0].length + _currentToSplit[1].length;
  }

  void _inputNumber(int number) {
    setState(() {
      if (_isOver) {
        _isOver = false;
      }

      _calculateCurrentToSplitLength();

      if (_currentToSplitLength <= 6) {
        if (!_isPointClicked) {
          _current = _current * 10 + number;
        } else {
          _varForTenInput = 1;
          _numberToDouble = number.toDouble();
          for (int i = 1; i <= _countForInput; i++) {
            _varForTenInput *= 10;
          }
          _current = _current + (_numberToDouble / _varForTenInput);
          _current = ((_current * _varForTenInput).roundToDouble()) / _varForTenInput;
          _countForInput++;
        }
        _isArithmeticError = false;
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
          _isPointClicked = false;
          _isOver = false;
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
          _isPointClicked = false;
          break;

        case "%":
          _current = _current / 100;
          _isPointClicked = false;
          break;

        case "÷":
          _firstResult = _current;
          _current = 0;
          _signNow = "÷";
          _isPointClicked = false;
          break;

        case "x":
          _firstResult = _current;
          _current = 0;
          _signNow = "x";
          _isPointClicked = false;
          break;

        case "-":
          _firstResult = _current;
          _current = 0;
          _signNow = "-";
          _isPointClicked = false;
          break;

        case "+":
          _firstResult = _current;
          _current = 0;
          _signNow = "+";
          _isPointClicked = false;
          break;

        case ".":
          if (!_isOver) {
            if (!_isPointClicked) {
              _isPointClicked = true;
            }
          }
          break;

        case "=":
          _secondResult = _current;

          switch (_signNow) {
            case "÷":
              if (_secondResult != 0) {
                _current = _firstResult / _secondResult;
              } else {
                _isArithmeticError = true;
              }
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
          _isPointClicked = false;
      }

      _currentToSplitLength = 0;
      _countForInput = 1;
    });
  }

  void _deleteNumber() {
    int tmp = 0;

    setState(() {
      if (!_isPointClicked) {
        tmp = (_current / 10).floor();
        _current = tmp.toDouble();
      } else {
        _varForTenDelete = 1;
        _currentToSplit = _current.toString().split('.');
        for (int i = 1; i <= _currentToSplit[1].length - 1; i++) {
          _varForTenDelete *= 10;
        }
        _current = ((_current * _varForTenDelete).floorToDouble()) / _varForTenDelete;

        _countForInput--;

        _currentToSplit = _current.toString().split('.');
        if (_currentToSplit[1] == '0') {
          _isPointClicked = false;
        }
      }
    });
  }
}

// When _currentToSplitLength is over 8,
// Input : make not user can input
// '=' : display 'Over!'