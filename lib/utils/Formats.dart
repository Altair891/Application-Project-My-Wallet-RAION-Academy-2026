import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/ExpenseCategory.dart';

const Color primaryColor = Color(0xFF176B55);
const Color backgroundColor = Color(0xFFF5F7F5);

String formatRupiah(int amount) {
  final digits = amount.toString();
  final result = StringBuffer();

  for (int i = 0; i < digits.length; i++) {
    result.write(digits[i]);
    final remaining = digits.length - i - 1;
    if (remaining > 0 && remaining % 3 == 0) {
      result.write('.');
    }
  }

  return 'Rp$result';
}

String formatTime(DateTime date) {
  final hour = date.hour.toString().padLeft(2, '0');
  final minute = date.minute.toString().padLeft(2, '0');
  return '$hour:$minute';
}

IconData iconForCategory(String category) {
  for (final item in expenseCategories) {
    if (item.name == category) return item.icon;
  }
  return Icons.receipt_long_rounded;
}

Color colorForCategory(String category) {
  for (final item in expenseCategories) {
    if (item.name == category) return item.color;
  }
  return primaryColor;
}