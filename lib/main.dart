import 'dart:math';

import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transaction_form.dart';
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
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 19,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: "t1",
      title: "Conta de Energia",
      value: 80.5,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Transaction(
      id: "t2",
      title: "Conta de água",
      value: 20.5,
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
    Transaction(
      id: "t3",
      title: "Conta de Internet",
      value: 30.5,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: "t3",
      title: "Conta de Internet",
      value: 70.5,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: "t3",
      title: "Conta de Internet",
      value: 30.5,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: "t3",
      title: "Conta de Internet",
      value: 80.5,
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
    Transaction(
      id: "t4",
      title: "Restaurante",
      value: 40.5,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    Transaction(
      id: "t5",
      title: "TV a cabo",
      value: 50.5,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t6",
      title: "IPTU",
      value: 60.5,
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
    Transaction(
      id: "t7",
      title: "IPVA",
      value: 70.5,
      date: DateTime.now().subtract(Duration(days: 6)),
    ),
  ];

  ///Retorna a lista de transações dos últimos 7 dias
  List<Transaction> get _recentTransactions {
    return _transactions.where((transaction) {
      //Verifica se a data da transação está depois de (dia atual - 7)
      //Será se isso está certo mesmo?
      //Como está verificando se a data está depois dos últimos 7 dias
      //Se a pessoa digitar uma data futura ex: 31/03/2050
      //Pelo que entendi vai passar na condição e será adicionada na lista de transações recentes
      return transaction.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

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

    _closeTransactionFormModal(context);
  }

  ///Função responsável por abrir a modal
  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return TransactionForm(_addTransaction);
        });
  }

  ///Função responsável por fechar a modal
  _closeTransactionFormModal(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Despesas Pessoais',
          style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
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
            Chart(_recentTransactions),
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
