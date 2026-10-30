import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/models/ExpenseCategory.dart';
import 'package:flutter_application_1/pages/AddExpensePage.dart';
import 'package:flutter_application_1/providers/ExpenseProvider.dart';
import 'package:flutter_application_1/widgets/CategoryItems.dart';
import 'package:flutter_application_1/widgets/ExpenseTile.dart';
import 'package:flutter_application_1/widgets/SectionHeading.dart';

const Color primaryColor = Color(0xFF176B55);

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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Membaca data dari ExpenseProvider
    final expenseProvider = Provider.of<ExpenseProvider>(context);
    final expenses = expenseProvider.expenses;
    final balance = expenseProvider.balance;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/Foto Formal Gilmar (B.Hitam).png',
                      width: 58,
                      height: 58,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 58,
                          height: 58,
                          color: const Color(0xFFDCEBE4),
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.person_rounded,
                            size: 34,
                            color: primaryColor,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Halo, Agil! 👋',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF202923),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Yuk, atur pengeluaranmu.',
                          style: TextStyle(fontSize: 13, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.account_balance_wallet_rounded,
                    size: 28,
                    color: primaryColor,
                  ),
                ],
              ),
              const SizedBox(height: 26),

              // Kartu Sisa Saldo Otomatis dari Provider
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withValues(alpha: 0.18),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sisa saldo kamu',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      formatRupiah(balance),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 22),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddExpensePage(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.add_rounded),
                        label: const Text('Catat Pengeluaran'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: primaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              const SectionHeading(
                title: 'Kategori',
                subtitle: 'Pilih kategori pengeluaranmu',
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  for (final category in expenseCategories)
                    Expanded(child: CategoryItem(category: category)),
                ],
              ),
              const SizedBox(height: 28),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SectionHeading(
                    title: 'Riwayat Pengeluaran',
                    subtitle: 'Catatan uang yang sudah keluar',
                  ),
                  Text(
                    '${expenses.length} transaksi',
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFE9EEEA)),
                ),
                child: expenses.isEmpty
                    ? const Padding(
                        padding: EdgeInsets.all(24),
                        child: Center(child: Text('Belum ada pengeluaran.')),
                      )
                    : Column(
                        children: [
                          for (int i = 0; i < expenses.length; i++) ...[
                            ExpenseTile(expense: expenses[i]),
                            if (i != expenses.length - 1)
                              const Divider(
                                height: 1,
                                color: Color(0xFFEDF0ED),
                              ),
                          ],
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
