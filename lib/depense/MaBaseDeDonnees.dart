import 'package:hive/hive.dart';

part 'MaBaseDeDonnees.g.dart';

@HiveType(typeId: 1)
class MaBaseDeDonnees {
      MaBaseDeDonnees({required this.idcategorie, required this.img});
      @HiveField(0)
      int idcategorie;

      @HiveField(1)
      String img;

}

