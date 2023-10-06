

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
            bottomTitles :AxisTitles(sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getBottomTitles,
            ),
            ),
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
Widget getBottomTitles(double value, TitleMeta meta){
  const style = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  Widget text;
  switch (value.toInt()){
    case 0:
      text= const Text('Jan', style: style,);
      break;
    case 1:
      text= const Text('Fev', style: style,);
      break;
    case 2:
      text= const Text('Mar', style: style,);
      break;
    case 3:
      text= const Text('Avr', style: style,);
      break;
    case 4:
      text= const Text('Mai', style: style,);
      break;
    case 5:
      text= const Text('jui', style: style,);
      break;
    case 6:
      text= const Text('Jul', style: style,);
      break;
    case 7:
      text= const Text('Aut', style: style,);
      break;
    case 8:
      text= const Text('Sep', style: style,);
      break;
    case 9:
      text= const Text('Oct', style: style,);
      break;
    case 10:
      text= const Text('Nov', style: style,);
      break;
    case 11:
      text= const Text('Dec', style: style,);
      break;
    default:
      text= const Text('', style: style,);
      break;
  }
  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}

