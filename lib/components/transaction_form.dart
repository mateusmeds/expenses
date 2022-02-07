import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {

  final void Function(String, double) onSubmitForm;

  TransactionForm(this.onSubmitForm, {Key? key}) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
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
              //Dessa forma funciona tanto para iOS e Android
              keyboardType: TextInputType.numberWithOptions(decimal: true),
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

                    //Acho que entendi
                    //Quando o usuário clicar em nova transação a função é executada
                    //Está fazendo a chamada da função e está passando esses dados para dentro da função
                    //que está no componente pai (TransactionUser)
                    widget.onSubmitForm(title, value);
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
