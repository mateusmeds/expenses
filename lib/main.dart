import 'package:expenses/components/transaction_user.dart';
import 'package:flutter/material.dart';

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

class HomePage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Despesas Pessoais"),
      ),
      //Todos os componentes estão dentro do Column
      body: Column(
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
          //Lista de transações
          //Formulário de cadastro de transação
          TransactionUser()
        ],
      ),
    );
  }
}
