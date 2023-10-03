

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
    BudgetData MybudgetData= BudgetData(
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
        barGroups:MybudgetData.budgetData.map
          ((data) => BarChartGroupData(
          x: data.x,
          barRods: [BarChartRodData(toY: data.y,
          color: Colors.red[300],
            width: 12,
            borderRadius: BorderRadius.circular(4)
          ),],
        )
        ).toList(),
      )
    );
  }
}