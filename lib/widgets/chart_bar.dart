import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spending;
  final double totalSpending;

  ChartBar(
    this.label,
    this.spending,
    this.totalSpending,
  );

  @override
  Widget build(BuildContext context) {
    return Column(

      children: <Widget>[
        Text(
          "৳ ${spending.toStringAsFixed(0)}",
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 4.0),
        ),
        Container(
          height: 70.0,
          width: 30.0,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.greenAccent,
                    width: 3.0,
                  ),
                  color: Color.fromRGBO(220, 220, 220, 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: totalSpending,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.purpleAccent,
                    border: Border.all(
                      color: Colors.greenAccent,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 4.0),
        ),
        Text("$label",
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ))
      ],
    );
  }
}
