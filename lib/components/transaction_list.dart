import 'package:flutter/material.dart';
import 'package:expenses/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;

  const TransactionList(this._transactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ..._transactions.map((transaction) {
        return Card(
          child: Row(
            children: <Widget>[
              //Valor da transação
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 2),
                ),
                padding: const EdgeInsets.all(10),
                child: Text(
                  "R\$ ${transaction.value.toString()}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple),
                ),
              ),
              //Título e Data
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Título
                  Text(
                    transaction.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  //Data
                  Text(
                    DateFormat("d MMM y").format(transaction.date),
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ],
          ),
        );
      }).toList(),
    ]);
  }
}
