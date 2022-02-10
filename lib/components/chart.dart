import 'package:expenses/components/chart_bar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

///Widget que exibe o gráfico de gastos dos últimos 7 dias da semana
class Chart extends StatelessWidget {
  ///Lista de transações dos últimos 7 dias.
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions, {Key? key}) : super(key: key);

  ///Valor total do gasto da semana
  double get totalExpenseWeek {
    return groupedTransacations.fold(0.0, (sum, transaction) {
      return sum + (transaction['value'] as double);
    });
  }

  ///Cria lista com as inicais dos dias da semana
  ///e o somatório do total de gasto de cada dia.
  ///A lista é criado com base no dia atual. Se hoje é quinta,
  ///o retorno é: (sexta) - S S D S T Q Q - (quinta)
  List<Map<String, Object>> get groupedTransacations {
    //Gera uma lista com x (7) elementos
    return List.generate(7, (index) {
      //Subtraindo o dia atual com os indexx [0, 6]
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      //Soma total do gasto do dia
      double totalSum = 0;

      //Verifica se a transação foi no dia atual
      for (var i = 0; i < recentTransactions.length; i++) {
        bool sameDay = recentTransactions[i].date.day == weekDay.day;
        bool sameMonth = recentTransactions[i].date.month == weekDay.month;
        bool sameYear = recentTransactions[i].date.year == weekDay.year;

        //Caso seja, entra para a soma deste dia
        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransactions[i].value;
        }
      }

      //Primeira letra do nome do dia da semana.
      String firstLetterDay = DateFormat.E().format(weekDay)[0];

      return {
        'day': firstLetterDay,
        'value': totalSum,
      };
    }).reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Total: ${totalExpenseWeek.toString()}");
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransacations.map((transaction) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: transaction['day'].toString(),
                value: transaction['value'] as double,
                percentage: totalExpenseWeek == 0 ? 0 : (transaction['value'] as double) / totalExpenseWeek,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
