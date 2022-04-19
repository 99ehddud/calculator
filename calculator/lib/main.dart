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
  int current = 0;
  int firstResult = 0;
  int secondResult = 0;

  String signNow = "";

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
                  current.toString(),
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
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
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
                  onPressed: () => _inputSign(""),
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
                  ),
                  child: Text(
                    "",
                    style: TextStyle(
                      fontSize: buttonTextFontSize,
                    ),
                  ),
                ),
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () => _inputSign("%"),
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
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
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
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
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
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
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
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
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
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
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
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
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
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
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
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
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
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
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
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
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
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
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
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
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
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
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
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
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
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
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
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
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
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
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
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
      if (current.toString().length > 7) {}
      current = current * 10 + number;
    });
  }

  void _inputSign(String sign) {
    setState(() {
      switch (sign) {
        case "C":
          current = 0;
          firstResult = 0;
          secondResult = 0;
          break;

        case "":

        case "%":

        case "÷":
          firstResult = current;
          current = 0;
          signNow = "÷";
          break;

        case "x":
          firstResult = current;
          current = 0;
          signNow = "x";
          break;

        case "-":
          firstResult = current;
          current = 0;
          signNow = "-";
          break;

        case "+":
          firstResult = current;
          current = 0;
          signNow = "+";
          break;

        case "=":
          secondResult = current;

          switch (signNow) {
            case "÷":
              current = firstResult ~/ secondResult;
              break;

            case "x":
              current = firstResult * secondResult;
              break;

            case "-":
              current = firstResult - secondResult;
              break;

            case "+":
              current = firstResult + secondResult;
              break;
          }
      }
    });
  }

  void _deleteNumber() {
    setState(() {
      current = current ~/ 10;
    });
  }
}
