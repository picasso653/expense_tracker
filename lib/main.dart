import 'package:flutter/material.dart';

import 'package:expense_tracker/widget/expenses.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Expenses(),
    ),
  );
}