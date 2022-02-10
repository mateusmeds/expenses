import 'package:flutter/material.dart';
import 'package:expenses/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;

  const TransactionList(this._transactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: _transactions.isEmpty
          ? Column(children: <Widget>[
              Text(
                'Nenhuma transação cadastrada.',
                style: Theme.of(context).textTheme.headline6,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              )
            ])
          : ListView.builder(
              //Quantidade de itens que vai ter na lista
              itemCount: _transactions.length,
              itemBuilder: (ctx, index) {
                final transaction = _transactions[index];

                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text("R\$ ${transaction.value}"),
                        ),
                      ),
                    ),
                    title: Text(
                      transaction.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat('d MMM y').format(transaction.date),
                    ),
                  ),
                );
              }),
    );
  }
}
