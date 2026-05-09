import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:main_fltr_lnt_a/app_theme.dart';
import 'package:main_fltr_lnt_a/models/transaction_model.dart';
import 'package:main_fltr_lnt_a/screens/transaction_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedMonth = DateTime(
    DateTime.now().year,
    DateTime.now().month,
  );

  List<TransactionModel> transactions = [];
  double income = 0;
  double expense = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Money Tracker'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => TransactionPage(),
            ),
          );
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<DateTime>(
              value: selectedMonth,
              isExpanded: true,
              menuMaxHeight: 250,
              items: List.generate(12, (index) {
                DateTime month = DateTime(
                  DateTime.now().year,
                  index + 1,
                );
                          
                return DropdownMenuItem(
                  value: month,
                  child: Text(
                    DateFormat('MMMM yyyy').format(month),
                  ),
                );
              }),
              onChanged: (value) {
                setState(() {
                  selectedMonth = value!;
                });
              },
            ),
            SizedBox(height: 20),
            Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      'Balance',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Rp ${NumberFormat('#,###', 'id_ID').format(income - expense).replaceAll(',', '.')}',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text('Income'),
                            SizedBox(height: 8),
                            Text(
                              'Rp ${NumberFormat('#,###', 'id_ID').format(income).replaceAll(',', '.')}',
                              style: TextStyle(
                                color: AppTheme.income,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Expense'),
                            SizedBox(height: 8),
                            Text(
                              'Rp ${NumberFormat('#,###', 'id_ID').format(expense).replaceAll(',', '.')}',
                              style: TextStyle(
                                color: AppTheme.expense,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: .centerStart,
                child: Text("Transaction List", style: TextStyle(fontWeight: .bold),),
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  TransactionModel transaction = transactions[index];
        
                  return Dismissible(
                    key: Key(transaction.id),
                    onDismissed: (_) {},
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => TransactionPage(
                                transaction: transaction,
                              ),
                            ),
                          );
                        },
                        leading: Text(DateFormat('dd/MM').format(transaction.date),),
                        title: Text(transaction.title),
                        subtitle: Text(transaction.category),
                        trailing: Text(
                          '${transaction.type == 'income' ? '+' : '-'} Rp ${NumberFormat('#,###', 'id_ID').format(transaction.amount).replaceAll(',', '.')}',
                          style: TextStyle(
                            color: transaction.type == 'income'
                                ? AppTheme.income
                                : AppTheme.expense,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}