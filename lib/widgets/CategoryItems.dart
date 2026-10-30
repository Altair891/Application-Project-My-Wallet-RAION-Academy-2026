import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/ExpenseCategory.dart';

// Widget buatan sendiri ini digunakan berulang kali untuk 4 kategori.
class CategoryItem extends StatelessWidget {
  final ExpenseCategory category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            color: category.color.withValues(alpha: 0.14),
            borderRadius: BorderRadius.circular(17),
          ),
          child: Icon(category.icon, color: category.color, size: 27),
        ),
        const SizedBox(height: 8),
        Text(
          category.name,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}