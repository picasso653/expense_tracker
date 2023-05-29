
import 'package:expense_tracker/widget/chart/chart.dart';
import 'package:expense_tracker/widget/expenses-list/expenses_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widget/new_expense.dart';
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

  void _openAddOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(
              onAddExpense: addExpense,
            ));
  }

  void addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(
          seconds: 3,
        ),
        content: const Text('Expense has been removed'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    Widget mainContent = const Center(
      child: Text('No expenses found.'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: _openAddOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: width < height ?Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(child: mainContent),
        ],
      ): Row(
        children: [
          Expanded(child: Chart(expenses: _registeredExpenses)),
          Expanded(child: mainContent)
        ],
      ),
    );
  }
}
