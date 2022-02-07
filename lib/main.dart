import 'dart:math';

import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_user.dart';
import 'package:flutter/material.dart';

import 'components/transaction_list.dart';
import 'models/transaction.dart';

main() {
  runApp(const ExpenseApp());
}

class ExpenseApp extends StatelessWidget {
  const ExpenseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _transactions = [
    Transaction(
        id: "t1",
        title: "Conta de Energia",
        value: 195.89,
        date: DateTime.now()),
    Transaction(
        id: "t2",
        title: "Conta de Energia",
        value: 195.89,
        date: DateTime.now()),
    Transaction(
        id: "t3",
        title: "Conta de Energia",
        value: 195.89,
        date: DateTime.now()),
    Transaction(
        id: "t4",
        title: "Conta de Energia",
        value: 195.89,
        date: DateTime.now()),
    Transaction(
        id: "t5",
        title: "Conta de Energia",
        value: 195.89,
        date: DateTime.now()),
    Transaction(
        id: "t6",
        title: "Conta de Energia",
        value: 195.89,
        date: DateTime.now()),
    Transaction(
        id: "t7",
        title: "Conta de Energia",
        value: 195.89,
        date: DateTime.now()),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    debugPrint("Título -> $title");
    debugPrint("Valor (R\$) -> $value");

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return TransactionForm(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Despesas Pessoais"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          )
        ],
      ),
      //Todos os componentes estão dentro do Column
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //Gráfico de despesas por dia na semana atual
            Container(
              width: double.infinity,
              child: const Card(
                color: Colors.blue,
                child: Text("Gráfico de Gastos"),
                elevation: 5,
              ),
            ),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
