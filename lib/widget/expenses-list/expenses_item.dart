import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

 class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Card(child:  Column(
        children: [
          Text(expense.title),
          const SizedBox(height: 5,),
          Row(
            children: [
              Text('\$ ${(expense.amount).toStringAsFixed(2)}' ),
              const Spacer(),
              Row(
                children:  [
                   Icon(categoryIcons[expense.category]),
                  const SizedBox(width: 8,),
                  Text(expense.formattedDate)
                ],
              )
            ],
          )
        ],
      )),
    );
  }
}