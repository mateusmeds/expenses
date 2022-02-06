import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final _transations = [
    Transaction(
        id: "t1", title: "Internet", value: 86.45, date: DateTime.now()),
    Transaction(
        id: "t2",
        title: "Conta de Energia",
        value: 195.89,
        date: DateTime.now()),
  ];

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
          //Lista de transações/gastos
          Column(children: <Widget>[
            ..._transations.map((transaction) {
              return Card(
                child: Row(
                  children: <Widget>[
                    //Valor da transação
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.purple, width: 2),
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
          ]),
          //Formulário de cadastro de transação
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  //Campo de título
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(labelText: 'Título'),
                  ),
                  //Campo de valor
                  TextField(
                    controller: valueController,
                    decoration: const InputDecoration(labelText: 'Valor (R\$)'),
                  ),
                  //Botão de cadastrar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: const Text('Cadastrar'),
                        onPressed: () {
                          debugPrint("Título -> ${titleController.text}");
                          debugPrint("Valor (R\$) -> ${valueController.text}");
                        },
                        style: TextButton.styleFrom(
                            primary: Colors.purple),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
