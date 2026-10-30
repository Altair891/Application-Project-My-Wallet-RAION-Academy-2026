class Expense {
  final String title;
  final String category;
  final String note;
  final int amount;
  final DateTime date;

  const Expense({
    required this.title,
    required this.category,
    required this.note,
    required this.amount,
    required this.date,
  });
}