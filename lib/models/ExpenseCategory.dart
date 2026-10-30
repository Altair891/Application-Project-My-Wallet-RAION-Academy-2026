import 'package:flutter/material.dart';

class ExpenseCategory {
  final String name;
  final IconData icon;
  final Color color;

  const ExpenseCategory({
    required this.name,
    required this.icon,
    required this.color,
  });
}

const List<ExpenseCategory> expenseCategories = [
  ExpenseCategory(
    name: 'Makanan',
    icon: Icons.restaurant_rounded,
    color: Color(0xFFFFA726),
  ),
  ExpenseCategory(
    name: 'Transport',
    icon: Icons.directions_bus_rounded,
    color: Color(0xFF42A5F5),
  ),
  ExpenseCategory(
    name: 'Belanja',
    icon: Icons.shopping_bag_rounded,
    color: Color(0xFFAB72D5),
  ),
  ExpenseCategory(
    name: 'Lainnya',
    icon: Icons.widgets_rounded,
    color: Color(0xFF26A69A),
  ),
];