import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main() {
  runApp(ExpenseApp());
}

class ExpenseApp extends StatelessWidget {
  const ExpenseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  final _transations = [
    Transaction(
        id: "t1", title: "Internet", value: 86.45, date: DateTime.now()),
    Transaction(
        id: "t2",
        title: "Conta de Energia",
        value: 95.89,
        date: DateTime.now()),
  ];

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Despesas Pessoais"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text("Gráfico de Gastos"),
              elevation: 5,
            ),
          ),
          Column(children: <Widget>[
            ..._transations.map((transaction) {
              return Card(child: Text(transaction.title));
            }).toList(),
          ]),
        ],
      ),
    );
  }
}
