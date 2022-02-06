import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmitForm;

  TransactionForm(this.onSubmitForm, {Key? key}) : super(key: key);



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
                    //Está atribuindo ao onPressed uma função anônima
                    //Que só será executada quando o usuário pressionar o botão
                    
                    //Atribuindo os dados do formulário para as respectivas variaveis
                    final title = titleController.text;
                    final value = double.tryParse(valueController.text) ?? 0.0;

                    //???
                    //Essa função aqui faz oq?
                    //Quando passo do TransactionUser para aqui eu estou passando uma referência?
                    //Quando essa função é executada está executando a função do TransactionUser?
                    //Que tal debugar amanhã?
                    onSubmitForm(title, value);
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