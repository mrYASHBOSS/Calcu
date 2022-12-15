import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';
import 'dart:math';

String expr = "";

String calcLogic(String btnVal, BuildContext ctx) {
  if (btnVal == "C") {
    expr = "";
  } else if (btnVal == '⌫') {
    expr = expr.substring(0, expr.length - 1);
  } else if (btnVal == 'π') {
    expr = expr + '3.141592';
  } else if (btnVal == 'e') {
    expr = expr + '2.718281';
  } else if (btnVal != '=') {
    expr = expr + btnVal;
    print(expr);
  } else if (btnVal == '=') {
    _eqvalTo(expr, ctx);
  } else {
    print("Something Went Wrong !!");
  }
  return expr;
}

_eqvalTo(String xpression, BuildContext ctx) {
  xpression = xpression.replaceAll('\u00d7', "*").replaceAll('\u2212', "-");
  xpression = xpression.replaceAll('\u2022', ".");
  xpression = xpression.replaceAll('\u0025', "^");

  late Expression expression;

  try {
    expression = Expression.parse(xpression);
  } on Exception catch (e) {
    print(e);
    final snackBar = SnackBar(
      content: Text('Ya! A SnackBar!'),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () => ScaffoldMessenger.of(ctx).removeCurrentSnackBar(),
      ),
    );
    ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
  }

  // Create context containing all the variables and functions used in the expression
  var context = {"^": exp, "cos": cos, "sin": sin};
// Evaluate expression
  final evaluator = ExpressionEvaluator();
  var r = evaluator.eval(expression, context);
  print(r); // = true
  expr =
      r.toString().length > 10 ? r.toString().substring(0, 10) : r.toString();
}
