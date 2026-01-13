import 'package:flutter/material.dart';

class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => calculatorApp();
}

class calculatorApp extends State<calculator> {
  String display = "0";
  String history = "0";
  double? firstOperand;
  String? operetor;
  bool isNewInput = false;

  void inputAngka(String angka) {
    setState(() {
      if (display == "0" || isNewInput) {
        display = angka;
      } else {
        if (angka == "." && display.contains(".")) return;
        display += angka;
      }
    });
  }

  void pilihOperator(String simbol) {
    setState(() {
      firstOperand = double.tryParse(display);
      operetor = simbol;
      history = "$display $simbol";
      isNewInput = true;
    });
  }

  void hitungHasil() {
    if (firstOperand == null || operetor == null) return;

    double secondOperand = double.parse(display);
    double hasil = 0;

    switch (operetor) {
      case "+":
        hasil = firstOperand! + secondOperand;
        break;
      case "-":
        hasil = firstOperand! - secondOperand;
        break;
      case "x":
        hasil = firstOperand! * secondOperand;
        break;
      case "/":
        hasil = firstOperand! / secondOperand;
        break;
      case "%":
        hasil = firstOperand! % secondOperand;
        break;
    }
    setState(() {
      history = "$firstOperand $operetor $secondOperand =";
      display = hasil.toString().replaceAll(RegExp(r'\.0$'), '');
      firstOperand = null;
      operetor = null;
      isNewInput = true;
    });
  }

  void reset() {
    setState(() {
      display = "0";
      history = "0";
      firstOperand = null;
      operetor = null;
      isNewInput = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF2E1A47), Color(0xFF1A1A2E)],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.menu),
                        iconSize: 28,
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                      Text(
                        'STANDARD',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.7),
                          letterSpacing: 4,
                          fontSize: 18,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.history),
                        iconSize: 28,
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24, bottom: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,

                      children: [
                        Text(
                          history,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white.withValues(alpha: 0.7),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          display,
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: CalcButton(
                                  child: Text(
                                    "AC",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  ontap: reset,
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: CalcButton(
                                  child: Icon(
                                    Icons.exposure,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: CalcButton(
                                  child: Text(
                                    "%",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  ontap: () => pilihOperator("%"),
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: CalcButton(
                                  child: Text(
                                    "/",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  ontap: () => pilihOperator("/"),
                                ),
                              ),
                              SizedBox(width: 5),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CalcButton(
                                  child: Text(
                                    "9",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  ontap: () => inputAngka("9"),
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: CalcButton(
                                  child: Text(
                                    "8",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  ontap: () => inputAngka('8'),
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: CalcButton(
                                  child: Text(
                                    "7",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  ontap: () => inputAngka('7'),
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: CalcButton(
                                  child: Text(
                                    "X",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  ontap: () => pilihOperator("x"),
                                ),
                              ),
                              SizedBox(width: 5),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CalcButton(
                                  child: Text(
                                    "6",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  ontap: () => inputAngka('6'),
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: CalcButton(
                                  child: Text(
                                    "5",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  ontap: () => inputAngka('5'),
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: CalcButton(
                                  child: Text(
                                    "4",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  ontap: () => inputAngka('4'),
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: CalcButton(
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  ontap: () => pilihOperator("-"),
                                ),
                              ),
                              SizedBox(width: 5),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CalcButton(
                                  child: Text(
                                    "3",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  ontap: () => inputAngka('3'),
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: CalcButton(
                                  child: Text(
                                    "2",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  ontap: () => inputAngka('2'),
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: CalcButton(
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  ontap: () => inputAngka('1'),
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: CalcButton(
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  ontap: () => pilihOperator("+"),
                                ),
                              ),
                              SizedBox(width: 5),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: CalcButton(
                                  child: Text(
                                    "0",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  isSquare: false,
                                  ontap: () => inputAngka("0"),
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: CalcButton(
                                  child: Text(
                                    ".",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  ontap: () => inputAngka('.'),
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: CalcButton(
                                  child: Text(
                                    "=",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  ontap: hitungHasil,
                                ),
                              ),
                              SizedBox(width: 5),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CalcButton extends StatelessWidget {
  const CalcButton({super.key, required this.child, this.isSquare = true, this.ontap});

  final Widget child;
  final bool isSquare;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    Widget button = Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white24,
          ),
          child: Center(child: child),
        ),
      ),
    );

    if (isSquare == true) {
      return AspectRatio(aspectRatio: 1, child: button);
    } else {
      return SizedBox(height: 104, child: button);
    }
  }
}
