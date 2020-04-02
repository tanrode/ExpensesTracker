import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() async{
  runApp(MyExpenses());
}

class MyExpenses extends StatefulWidget {
  @override
  _MyExpensesState createState() => _MyExpensesState();
}

class _MyExpensesState extends State<MyExpenses> {

  List<Transactions> items = [
    Transactions(id: 'i1', title: 'Shoes', amt: 1999, date: DateTime.now()),
    Transactions(id: 'i2', title: 'Snacks', amt: 350, date: DateTime.now()),
    Transactions(id: 'i3', title: 'Fruits', amt: 275, date: DateTime.now()),
  ];
  String titleInput;
  String amountInput;

  void addItem(String t,double a,DateTime d)
  {
    setState(() {
      items.add(Transactions(id: 't1',title: t,amt: a,date: d));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 0, 0, 0.8),
          title: Text('My Expenses App'),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          margin: EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              Card(
                color: Color.fromRGBO(0, 204, 255, 0.8),
                child: Container(
                  width: 90,
                  margin: EdgeInsets.all(5),
                  child: Text(
                    'Hello',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                elevation: 7,
              ),
              Card(
                elevation: 5,
                child:Container(
                  margin: EdgeInsets.all(10),
                  child: Column(children: [
                    TextField(decoration: InputDecoration(labelText: 'Title'),onChanged: (val) => titleInput=val,),
                    TextField(decoration: InputDecoration(labelText: 'Amount'),onChanged: (val) => amountInput=val,),
                    //TextField(decoration: InputDecoration(labelText: 'Date')),
                    FlatButton(onPressed: () => addItem(titleInput,double.parse(amountInput),DateTime.now()), child: Text('Enter'))
                  ],),
                ),
              ),
              Column(
                  children: items.map((li) {
                return Card(
                  color: Color.fromRGBO(0, 255, 153, 0.8),
                  child: Container(
                    width: 300,
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(5),
                          //color: Color.fromRGBO(255, 204, 204, 1),
                          decoration: BoxDecoration(
                              border: Border.all(
                              width: 2,
                              color: Colors.black,
                            ),
                            color: Color.fromRGBO(255, 204, 204, 1),
                          ),
                          child: Text(
                            'Rs.' + li.amt.toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        padding: EdgeInsets.fromLTRB(2, 1, 2, 1), 
                        ),
                        Container(
                          width: 180,
                          child: Column(
                            children: <Widget>[
                              Text(li.title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold)),
                              Text(DateFormat.yMMMd().format(li.date),
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.w500))
                            ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                          ),
                        ),
                      ],
                      //mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    margin: EdgeInsets.all(5),
                  ),
                  elevation: 5,
                );
              }).toList()),
            ],
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
