import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/chart_bar.dart';
import '../model/transaction.dart';

class Chart extends StatelessWidget {
  List<Transaction> recentTransaction = [];

  Chart(this.recentTransaction);

  List<Map<String, Object>> get transactionValues {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );

        double totalSum = 0.0;

        for (int i = 0; i < recentTransaction.length; i++) {
          if (recentTransaction[i].date.day == weekDay.day &&
              recentTransaction[i].date.month == weekDay.month &&
              recentTransaction[i].date.year == weekDay.year) {
            totalSum += recentTransaction[i].amount;
          }
        }
        return {"day": DateFormat.E().format(weekDay), "amount": totalSum};
      },
    ).reversed.toList();
  }

  double get maxSpending {

    return transactionValues.fold(0.0, (sum, item){

      if(sum + item['amount'] == 0) {
        return 1;
      } else {
        return sum + item['amount'];
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
      height: 130.0,
      width: double.infinity,
      color: Colors.greenAccent,
      child: Card(
        elevation: 20.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: transactionValues.map((data){
            return ChartBar(data['day'], data['amount'], (data['amount']as double) / maxSpending );
          }).toList(),
        ),
      ),
    );
  }
}
