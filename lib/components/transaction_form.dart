import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  TransactionForm({Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  style: TextButton.styleFrom(primary: Colors.purple),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
