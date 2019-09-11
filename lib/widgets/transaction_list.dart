import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions = [];

  Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0, bottom: 5.0),
      height: 355.0,
      width: double.infinity,
      child: ListView(
        children: <Widget>[
          Card(
            elevation: 20.0,
            child: transactions.isEmpty
                ? Column(
                    children: <Widget>[
                      Text(
                        "No Transaction Added yet !",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      Image.asset("assets/images/waiting.png"),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      Text(
                        "Add One Transaction !",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: transactions.map((tx) {
                      return Container(
                        color: Colors.purpleAccent,
                        height: 60.0,
                        width: double.infinity,
                        child: Card(
                          elevation: 10.0,
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 123,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 5.0, color: Colors.greenAccent),
                                ),
                                padding: EdgeInsets.all(7.0),
                                child: FittedBox(
                                  child: Text(
                                    "৳ " + tx.amount.toString(),
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.purpleAccent,
                                    ),
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                    left: 3.0,
                                    right: 5.0,
                                    top: 1.0,
                                    bottom: 1.0),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 0.0, right: 5.0),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      tx.title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                    Text(
                                      DateFormat.yMMMd().format(tx.date),
                                      style: TextStyle(
                                        fontSize: 17.0,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.delete_forever,
                                  color: Colors.purpleAccent,
                                  size: 40.0,
                                ),
                                splashColor: Colors.purpleAccent,
                                onPressed: () {
                                  deleteTransaction(tx.id);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
          ),
        ],
      ),
    );
  }
}
