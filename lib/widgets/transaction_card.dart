import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final amountController = TextEditingController();
  final titleController = TextEditingController();
  DateTime pickedDate;

  final Function newTransaction;

  TransactionCard(this.newTransaction);

  void presentDatePicket(BuildContext ctx) {
    showDatePicker(
      context: ctx,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((chosenDate){

      if(chosenDate == null) {
        return;
      } else {
        pickedDate = chosenDate;
      }
    });
  }

  void submitData(){
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(pickedDate == null) {
      pickedDate = DateTime.now();
    }

    if(enteredTitle.isEmpty || enteredAmount <= 0 ){
      return;
    } else {

      newTransaction(
        titleController.text,
        double.parse(amountController.text),
        pickedDate,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      height: 210.0,
      width: double.infinity,
      margin: EdgeInsets.only(
        top: 10.0,
        left: 5.0,
        right: 5.0,
      ),
      child: Card(
        elevation: 20.0,
        child: Container(
          padding: EdgeInsets.only(
            left: 15.0,
            right: 15.0,
          ),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: "Title",
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Amount",
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
                keyboardType: TextInputType.number,
                controller: amountController,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              Row(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {

                      presentDatePicket(context);
                    },
                    child: Text(
                      "Pick Date",
                      style: TextStyle(
                        color: Colors.purpleAccent,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  ),
                  RaisedButton(
                    onPressed: () {
                      submitData();
                    },
                    elevation: 20.0,
                    padding: EdgeInsets.all(0.0),
                    child: Container(
                      height: 60.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Colors.purple,
                            Colors.purpleAccent,
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Submit Transaction",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
