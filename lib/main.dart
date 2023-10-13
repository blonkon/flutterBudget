import 'package:budgetflutter/Basebox.dart';
import 'package:budgetflutter/depense/MaBaseDeDonnees.dart';
import 'package:budgetflutter/depense/depense_accueil.dart';
import 'package:budgetflutter/pages/ConnexionPage.dart';
import 'package:budgetflutter/pages/accueil.dart';
import 'package:budgetflutter/pages/budget.dart';
import 'package:budgetflutter/pages/categorie.dart';
import 'package:budgetflutter/pages/historique.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'depense/MontantModel.dart';


Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MaBaseDeDonneesAdapter());
  Catbox = await Hive.openBox<MaBaseDeDonnees>('userBox');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MontantModel()),
      //ChangeNotifierProvider(create: (_) => testModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      routes: {
        "/budget": (contex)=>budget(),
        "/depense": (contex)=>depense_accueil(),
        "/categorie": (contex)=>categorie(),
        "/historique": (contex)=>historique(),
      },  
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: ConnexionPage(),
    );
  }
}
