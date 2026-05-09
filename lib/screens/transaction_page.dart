import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:main_fltr_lnt_a/models/transaction_model.dart';

class TransactionPage extends StatefulWidget {
  final TransactionModel? transaction;

  TransactionPage({this.transaction});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController titleController;
  late TextEditingController amountController;

  String category = 'Food';
  String type = 'expense';

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController(
      text: widget.transaction?.title ?? '',
    );

    amountController = TextEditingController(
      text: widget.transaction?.amount.toString() ?? '',
    );

    category = widget.transaction?.category ?? 'Food';
    type = widget.transaction?.type ?? 'expense';
    selectedDate = widget.transaction?.date ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    bool isEdit = widget.transaction != null;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Transaction' : 'Add Transaction'),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Align(
                alignment: .centerStart,
                child: Text("Date & Time: ", textAlign: .start),
              ),
              Row(
                mainAxisAlignment: .center,
                children: [
                  SizedBox(
                    child: OutlinedButton(
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2100),
                        );

                        if (pickedDate != null) {
                          setState(() {
                            selectedDate = DateTime(
                              pickedDate.year,
                              pickedDate.month,
                              pickedDate.day,
                              selectedDate.hour,
                              selectedDate.minute,
                            );
                          });
                        }
                      },
                      child: Text(
                        DateFormat('dd-MM-yyyy').format(selectedDate),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),

                  SizedBox(
                    child: OutlinedButton(
                      onPressed: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(selectedDate),
                        );

                        if (pickedTime != null) {
                          setState(() {
                            selectedDate = DateTime(
                              selectedDate.year,
                              selectedDate.month,
                              selectedDate.day,
                              pickedTime.hour,
                              pickedTime.minute,
                            );
                          });
                        }
                      },
                      child: Text(
                        DateFormat('HH:mm').format(selectedDate),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),

              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter title';
                  }

                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter amount';
                  }

                  return null;
                },
              ),
              SizedBox(height: 16),
              Align(
                alignment: .centerStart,
                child: Text("Category:", textAlign: .start),
              ),
              SizedBox(height: 8),
              DropdownButtonFormField(
                value: category,
                items: [
                  'Food',
                  'Transport',
                  'Shopping',
                  'Salary',
                ].map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    category = value!;
                  });
                },
              ),
              SizedBox(height: 16),
              Align(
                alignment: .centerStart,
                child: Text("Type: ", textAlign: .start),
              ),
              SizedBox(height: 8),
              DropdownButtonFormField(
                value: type,
                items: ['income', 'expense'].map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    type = value!;
                  });
                },
              ),
              SizedBox(height: 16),
              
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(isEdit ? 'Close' : 'Cancel'),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          TransactionModel transaction = TransactionModel(
                            id: widget.transaction?.id ?? '',
                            title: titleController.text,
                            category: category,
                            amount: double.parse(amountController.text),
                            type: type,
                            date: selectedDate,
                          );

                          Navigator.pop(context);
                        }
                      },
                      child: Text(isEdit ? 'Save' : 'Create'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}