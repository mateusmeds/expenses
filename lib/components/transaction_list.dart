import 'package:flutter/material.dart';
import 'package:expenses/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;

  const TransactionList(this._transactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 335,
      child: ListView.builder(
          //Quantidade de itens que vai ter na lista
          itemCount: _transactions.length,
          itemBuilder: (ctx, index) {
            final transaction = _transactions[index];

            return Card(
              child: Row(
                children: <Widget>[
                  //Valor da transação
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        //Setando a cor primária do tema
                        color: Theme.of(context).primaryColor,
                        width: 2
                      ),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "R\$ ${transaction.value.toStringAsFixed(2)}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          //Setando a cor primária do tema
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                  //Título e Data
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //Título
                      Text(
                        transaction.title,
                        //Pegando estilização da headline6 dentro de ThemeData -> textTheme
                        style: Theme.of(context).textTheme.headline6,
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
          }),
    );
  }
}
