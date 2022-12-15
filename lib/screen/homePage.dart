import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycalc/logic/calcLogic.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  String expr = "";
  String initial = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).dividerColor,
        centerTitle: true,
        title: Text(
          "Calcu",
          style: TextStyle(color: Theme.of(context).focusColor),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                alignment: Alignment.bottomRight,
                child: Text(
                  expr.isNotEmpty ? expr : initial,
                  style: GoogleFonts.lato(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).focusColor),
                ),
              ),
            ),
            Container(
              height: 430,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Theme.of(context).dividerColor,
              ),
              child: Column(
                children: [
                  //Row 1 Button..........
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildBtn(
                            'C', Colors.white, Color.fromRGBO(247, 184, 68, 1)),
                        _buildBtn("\u03C0", Color.fromRGBO(202, 163, 86, 1),
                            Color.fromRGBO(246, 240, 226, 1)),
                        _buildBtn("\u0065", Color.fromRGBO(202, 163, 86, 1),
                            Color.fromRGBO(246, 240, 226, 1)),
                        _buildBtn('\u00d7', Color.fromRGBO(102, 50, 156, 1),
                            Color.fromRGBO(225, 213, 233, 1)),
                      ],
                    ),
                  ),
                  // Row 2 Button..................
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildBtn('7', Colors.black45,
                            Color.fromRGBO(240, 241, 243, 1)),
                        _buildBtn('8', Colors.black45,
                            Color.fromRGBO(240, 241, 243, 1)),
                        _buildBtn('9', Colors.black45,
                            Color.fromRGBO(240, 241, 243, 1)),
                        _buildBtn('\u002f', Color.fromRGBO(102, 50, 156, 1),
                            Color.fromRGBO(225, 213, 233, 1)),
                      ],
                    ),
                  ),
                  // Row 3 Button..........
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildBtn('4', Colors.black45,
                            Color.fromRGBO(240, 241, 243, 1)),
                        _buildBtn('5', Colors.black45,
                            Color.fromRGBO(240, 241, 243, 1)),
                        _buildBtn('6', Colors.black45,
                            Color.fromRGBO(240, 241, 243, 1)),
                        _buildBtn('\u2212', Color.fromRGBO(102, 50, 156, 1),
                            Color.fromRGBO(225, 213, 233, 1)),
                      ],
                    ),
                  ),
                  // Row 4 Button
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildBtn('1', Colors.black45,
                            Color.fromRGBO(240, 241, 243, 1)),
                        _buildBtn('2', Colors.black45,
                            Color.fromRGBO(240, 241, 243, 1)),
                        _buildBtn('3', Colors.black45,
                            Color.fromRGBO(240, 241, 243, 1)),
                        _buildBtn('\u002b', Color.fromRGBO(102, 50, 156, 1),
                            Color.fromRGBO(225, 213, 233, 1)),
                      ],
                    ),
                  ),
                  // Row 5 Button
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildBtn('.', Colors.black45,
                            Color.fromRGBO(240, 241, 243, 1)),
                        _buildBtn('0', Colors.black45,
                            Color.fromRGBO(240, 241, 243, 1)),
                        _buildBtn('\u232b', Colors.black45,
                            Color.fromRGBO(240, 241, 243, 1)),
                        _buildBtn('\u003d', Colors.white,
                            Color.fromRGBO(157, 76, 241, 1)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildBtn(btnTxt, txtColor, bgColor) {
    return Container(
      height: 70,
      width: 70,
      child: ElevatedButton(
        onPressed: () {
          expr = calcLogic(btnTxt, context);
          setState(() {});
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(38.0),
            ),
          ),
          foregroundColor: MaterialStateProperty.all(txtColor),
          backgroundColor: MaterialStateProperty.all(bgColor),
        ),
        child: Text(
          "$btnTxt",
          style: GoogleFonts.lato(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
