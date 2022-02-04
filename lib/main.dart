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
        value: 195.89,
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
            child: const Card(
              color: Colors.blue,
              child: Text("Gráfico de Gastos"),
              elevation: 5,
            ),
          ),
          Column(children: <Widget>[
            ..._transations.map((transaction) {
              return Card(
                child: Row(
                  children: <Widget> [
                    //Valor da transação
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.deepPurpleAccent,
                          width: 2
                        )
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "R\$ ${transaction.value.toString()}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.deepPurpleAccent
                        ),
                      ),
                    ),
                    //Título e Data
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget> [
                        Text(
                          transaction.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          transaction.date.toString(),
                          style: TextStyle(
                            color: Colors.grey
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          ]),
        ],
      ),
    );
  }
}
