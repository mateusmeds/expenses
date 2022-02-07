import 'dart:math';

import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key? key}) : super(key: key);

  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Passando a função para receber os dados do componente filho ao executar a chamada da função
        TransactionForm(_addTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
