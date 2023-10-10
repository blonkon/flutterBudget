import 'package:budgetflutter/Statistique/individual_bar.dart';

class BudgetData {
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


List<IndividualBar> budgetData = [];

  void initializeBudgetData() {
    budgetData = [
      IndividualBar(x: 0, y: janAmount),
      IndividualBar(x: 1, y: fevAmount),
      IndividualBar(x: 2, y: marAmount),
      IndividualBar(x: 3, y: avrAmount),
      IndividualBar(x: 4, y: maiAmount),
      IndividualBar(x: 5, y: junAmount),
      IndividualBar(x: 6, y: julAmount),
      IndividualBar(x: 7, y: autAmount),
      IndividualBar(x: 8, y: sepAmount),
      IndividualBar(x: 9, y: octAmount),
      IndividualBar(x: 10, y: novAmount),
       IndividualBar(x: 11, y: decAmount),
    ];
  }
}