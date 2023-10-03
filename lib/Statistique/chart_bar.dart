

import 'dart:ui';

import 'package:budgetflutter/Statistique/budget_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'budget_data.dart';

class MyBarGraph extends StatelessWidget {
  final List budgetValue;

  const MyBarGraph({super.key, required this.budgetValue});

  @override
  Widget build(BuildContext context) {
    //initialisation BarDAta
    BudgetData MybudgetData = BudgetData(
        janAmount: budgetValue[0],
        fevAmount: budgetValue[1],
        marAmount: budgetValue[2],
        avrAmount: budgetValue[3],
        maiAmount: budgetValue[4],
        junAmount: budgetValue[5],
        julAmount: budgetValue[6],
        autAmount: budgetValue[7],
        sepAmount: budgetValue[8],
        octAmount: budgetValue[9],
        novAmount: budgetValue[10],
        decAmount: budgetValue[11]);
    MybudgetData.initializeBudgetData();
    return BarChart(
        BarChartData(
          maxY: 100,
          minY: 0,
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            show: true,
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
           // leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),

          barGroups: MybudgetData.budgetData.map
            ((data) =>
              BarChartGroupData(
                x: data.x,
                barRods: [BarChartRodData(toY: data.y,
                  color: Colors.red[300],
                  width: 12,
                  borderRadius: BorderRadius.circular(4),
                  backDrawRodData: BackgroundBarChartRodData(
                    show: true,
                    toY: 100,
                    color: Colors.grey[200],
                  ),
                ),
                ],
              )
          ).toList(),
        ),
    );
  }
}
Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  Widget text;

  switch (value.toInt()) { // Remplacez "Switch" par "switch"
    case 0:
      text = const Text('S', style: style);
      break;
    default:
      text = const Text('Autre texte par défaut', style: style); // Ajoutez une valeur par défaut si nécessaire
  }

  return text; // Ajoutez un "return" pour retourner le Widget
}

