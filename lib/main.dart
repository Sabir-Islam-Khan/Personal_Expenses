import 'package:flutter/material.dart';

import './widgets/chart.dart';
import './widgets/transaction_card.dart';
import './widgets/transaction_list.dart';
import 'model/transaction.dart';

void main() {
  runApp(
    PersonalExpenses(),
  );
}

class PersonalExpenses extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PersonalExpensesState();
  }
}

class PersonalExpensesState extends State<PersonalExpenses> {

  void addNewTransaction(String txTitle, double txAmount, DateTime date) {
    String id;
    id = DateTime.now().toString();

    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      id: id,
      date: date,
    );
    setState(() {
      userTransaction.add(newTx);
    });
  }

  List<Transaction> userTransaction = [];

  List<Transaction> get recentTransaction {
    return userTransaction.where((index) {
      return index.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void deleteTransaction(String id) {
    setState(() {
      userTransaction.removeWhere((tx){
        return tx.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Quicksand",
        primaryColor: Colors.greenAccent
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Personal Expenses",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.greenAccent,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Chart(recentTransaction),
                TransactionCard(addNewTransaction),
                TransactionList(userTransaction, deleteTransaction),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
