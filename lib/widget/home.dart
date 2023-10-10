import 'package:budgetflutter/model/budget.dart';
import 'package:budgetflutter/pages/budget.dart';
import 'package:budgetflutter/pages/categorie.dart';
import 'package:budgetflutter/pages/depense.dart';
import 'package:budgetflutter/pages/historique.dart';
import 'package:budgetflutter/pages/profil.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:budgetflutter/services/budgetService.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late Future<Budget> futureBudget;

  @override
  void initState() {
    super.initState();
    futureBudget = BudgetService().budget();
  }

  List imgData = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
    "assets/images/5.png",
    "assets/images/6.png",
  ];

  List<String> titles = [
    "Budget",
    "Depense",
    "Categorie",
    "Historique",
    "Alerte",
    "Statistique",
  ];

  List card = [
    Budget(),
    depense(),
    categorie(),
    historique(),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: const Alignment(0, 3.5),
            children: [
              Container(
                  height: 200,
                  color: const Color(0xFF175419),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 15.0, left: 15),
                            child: Text(
                              "Bienvenue Ibrahim",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => UserProfil()));
                            },
                            icon: Icon(
                              Icons.account_circle_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Image.asset(
                          "assets/images/logoBlanc.png",
                          height: 140,
                          width: 150,
                          // scale: 10.5,
                        ),
                      )
                    ],
                  )),
              Container(
                height: 130,
                width: 300,
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Color(0xFFF0F1F0),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 25.0, right: 18),
                    child: Icon(
                      Icons.refresh_outlined,
                      color: Color(0xFF175419),
                      size: 30.0,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 25.0, right: 18),
                    child: Text(
                      "Solde principale",
                      style: TextStyle(
                        color: Color(0xFF175419),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  FutureBuilder<Budget>(
                    future: futureBudget,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        debugPrint("${snapshot.data}");
                        return Padding(
                          padding: EdgeInsets.only(bottom: 25.0, right: 1),
                          child: Text(
                            "${snapshot.data!.montant} f",
                            style: const TextStyle(
                              color: const Color(0xFF175419),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        debugPrint("${snapshot.hasError}");
                        return Text('${snapshot.error}');
                      }

                      // By default, show a loading spinner.
                      return const CircularProgressIndicator();
                    },
                  )

                  // Padding(
                  //   padding: EdgeInsets.only(bottom: 25.0, right: 1),
                  //   child: Text(
                  //     "140.000 f",
                  //     style: TextStyle(
                  //       color: const Color(0xFF175419),
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                ]),
              ),

              // ==============
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 100, left: 40, right: 40),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: imgData.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => card[
                              index], // Remplacez Categorie par le nom de votre widget de nouvelle page
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 227, 247, 227),
                              spreadRadius: 1,
                              blurRadius: 6,
                            )
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            imgData[index],
                            width: 100,
                          ),
                          Text(
                            titles[index],
                            // overflow: TextOverflow.visible,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 41, 39, 39),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
