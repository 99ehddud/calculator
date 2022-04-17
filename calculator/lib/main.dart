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

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double buttonHorizontalMargin = deviceWidth * 0.2 / 5;
    final double buttonWidth = deviceWidth * 0.8 / 4;
    final double displayDivHeight = deviceHeight * 0.3;
    final double displayTopPadding = displayDivHeight * 0.7;
    final double textFieldHeight = displayDivHeight * 0.3;
    final double buttonDivHeight = deviceHeight * 0.4;
    final double buttonVerticalMargin = deviceHeight * 0.2 / 6;
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
                    top: displayTopPadding, right: buttonHorizontalMargin, left: buttonHorizontalMargin),
                child: Text(
                  current.toString(),
                  textAlign: TextAlign.right,
                  style:
                      TextStyle(fontSize: textFieldHeight, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: buttonVerticalMargin),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
                  ),
                  child: const Text("C"),
                ),
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
                  ),
                  child: const Text(""),
                ),
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
                  ),
                  child: const Text("%"),
                ),
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
                  ),
                  child: const Text("→"),
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
                  child: const Text("7"),
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
                  child: const Text("8"),
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
                  child: const Text("9"),
                ),
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
                  ),
                  child: const Text("÷"),
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
                  child: const Text("4"),
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
                  child: const Text("5"),
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
                  child: const Text("6"),
                ),
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
                  ),
                  child: const Text("x"),
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
                  child: const Text("1"),
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
                  child: const Text("2"),
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
                  child: const Text("3"),
                ),
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
                  ),
                  child: const Text("-"),
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
                  onPressed: () {},
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
                  ),
                  child: const Text("0"),
                ),
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
                  ),
                  child: const Text("."),
                ),
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
                  ),
                  child: const Text("="),
                ),
                SizedBox(width: buttonHorizontalMargin),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: MaterialStateProperty.all(
                      Size(buttonWidth, buttonHeight),
                    ),
                  ),
                  child: const Text("+"),
                ),
                SizedBox(width: buttonHorizontalMargin),
              ],
            ),
            SizedBox(height: deviceHeight * 0.1),
          ],
        ),
      ),
    );
  }

  void _inputNumber(int number) {
    setState(() {
      current = current * 10 + number;
      print(current);
    });
  }

  void _inputSign(String sign) {
    setState(() {});
  }

  void _deleteNumber() {
    setState(() {});
  }
}
