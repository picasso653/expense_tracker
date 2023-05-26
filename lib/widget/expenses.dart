import 'package:expense_tracker/widget/expenses-list/expenses_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        amount: 20.99,
        date: DateTime.now(),
        title: 'Online Course',
        category: Category.work),
    Expense(
        amount: 20.99,
        date: DateTime.now(),
        title: 'Beach Party',
        category: Category.leisure)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('The Chart'),
          Expanded(
              child: ExpensesList(
            expenses: _registeredExpenses,
          ))
        ],
      ),
    );
  }
}
