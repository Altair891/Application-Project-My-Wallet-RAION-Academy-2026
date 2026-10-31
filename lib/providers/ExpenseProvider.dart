import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Expense.dart';

class ExpenseProvider extends ChangeNotifier {
  int _balance = 500000;
  final List<Expense> _expenses = [
    Expense(
      title: 'Nasi ayam',
      category: 'Makanan',
      note: 'Makan siang',
      amount: 18000,
      date: DateTime(2026, 10, 18, 12, 15),
    ),
    Expense(
      title: 'Ojek online',
      category: 'Transport',
      note: 'Perjalanan ke kampus',
      amount: 12000,
      date: DateTime(2026, 10, 18, 9, 10),
    ),
    Expense(
      title: 'Kopi susu',
      category: 'Makanan',
      note: 'Kopi sebelum kelas',
      amount: 15000,
      date: DateTime(2026, 10, 18, 8, 5),
    ),
    Expense(
      title: 'Pulsa',
      category: 'Lainnya',
      note: 'Paket internet',
      amount: 25000,
      date: DateTime(2026, 10, 17, 19, 30),
    ),
  ];

  int get balance => _balance;
  List<Expense> get expenses => List.unmodifiable(_expenses);

  void addExpense(Expense newExpense) {
    _expenses.insert(0, newExpense);
    _balance -= newExpense.amount;
    notifyListeners();
  }

  void deleteExpense(int index) {
    if (index >= 0 && index < _expenses.length) {
      final removedAmount = _expenses[index].amount;
      _balance += removedAmount;
      _expenses.removeAt(index);
      notifyListeners();
    }
  }
}
