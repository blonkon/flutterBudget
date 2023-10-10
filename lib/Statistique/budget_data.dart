import 'package:budgetflutter/Statistique/individual_bar.dart';

class BudgetData{
  final double janAmount;
  final double fevAmount;
  final double marAmount;
  final double avrAmount;
  final double maiAmount;
  final double junAmount;
  final double julAmount;
  final double autAmount;
  final double sepAmount;
  final double octAmount;
  final double novAmount;
  final double decAmount;
  //constructeur
  BudgetData({
    required this.janAmount,
    required this.fevAmount,
    required this.marAmount,
    required this.avrAmount,
    required this.maiAmount,
    required this.junAmount,
    required this.julAmount,
    required this.autAmount,
    required this.sepAmount,
    required this.octAmount,
    required this.novAmount,
    required this.decAmount,
  });


List<IndividualBar> budgetData =[];
//initialisation de la bar
void initializeBudgetData(){
  budgetData =
      [
        //janvier
        IndividualBar(x: 0, y: janAmount),
        //fevrier
        IndividualBar(x: 1, y: fevAmount),
        //mars
        IndividualBar(x: 2, y: marAmount),
        //avril
        IndividualBar(x: 3, y: avrAmount),
        //mai
        IndividualBar(x: 4, y: maiAmount),
        //juin
        IndividualBar(x: 5, y: junAmount),
        //jullet
        IndividualBar(x: 6, y: julAmount),
        //aout
        IndividualBar(x: 7, y: autAmount),
        //sep
        IndividualBar(x: 8, y: sepAmount),
        //oc
        IndividualBar(x: 9, y: octAmount),
        //nov
        IndividualBar(x: 10, y: novAmount),
        //decembre
        IndividualBar(x: 11, y: decAmount),

      ];
}
}