
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
class UserProfil extends StatefulWidget {
  const UserProfil({super.key});

  @override
  State<UserProfil> createState() => _UserProfilState();
}

class _UserProfilState extends State<UserProfil> {
  @override
  void initState(){
    super.initState();
  }
  void partagerApplication() {
    final RenderBox box = context.findRenderObject() as RenderBox;
    final String text = "Découvrez cette superbe application !";

    Share.share(text,
        subject: 'Sujet du partage',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
          title: Center(
          child: Text("Profil"),
        ),
        leading: Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: IconButton( // Bouton de retour
            color: Colors.green.shade900,
            icon: const Icon(Icons.arrow_back_rounded, size: 40),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 7,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35.5),
                      bottomRight: Radius.circular(35.5),
                    ),
                        color: Colors.green,
                        gradient: LinearGradient(
                            colors: [Color(0xFF146017),
                                    Color(0xFF309333)],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        //tileMode: TitleMode.clamp)
                  )
                ),
                ),
                //photo de profil
                Positioned(
                  bottom: -80.0,
                  child: InkWell(
                    child: CircleAvatar(
                      radius: 75,
                      backgroundColor: Colors.black,
                      child: ClipRRect(
                        child: Image.asset('assets/images/user.png'),
                      ),
                    ),
                  ),
                ),
              ]),
            const SizedBox(
              height: 55,
            ),
            Padding(padding: EdgeInsets.all(20.0),
            child: Padding(
              padding: EdgeInsets.all(40.0),
              child: Column(
                children: [
                  Card(
                    elevation: 8,
                    child: ListTile(
                      leading: Icon(
                        Icons.bookmark_added_sharp,
                        color: Colors.green,
                      ),
                      title: Text("Evaluer l'Application"),
                      tileColor: Colors.white,
                    ),
                  ),
                  Card(
                    elevation:8,
                    child: ListTile(
                      onTap: partagerApplication,
                      leading: Icon(
                        Icons.share,
                        color: Colors.green,
                      ),
                      title: Text("PArtager l'application "),
                      tileColor: Colors.white,
                    ),
                  ),
                  Card(
                    elevation:8,
                    child: ListTile(
                      leading: Icon(
                        Icons.bookmark_add,
                        color: Colors.green,
                      ),
                      title: Text("A Propos"),
                      tileColor: Colors.white,
                    ),
                  ),
                  Card(
                    elevation: 8,
                    margin: EdgeInsets.only(top: 50),
                    child: ListTile(
                      title: Center(
                        child: Text(
                          "Se Déconnecter",
                          style: TextStyle(
                            fontSize: 24, //
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      tileColor: Colors.green,
                    ),
                  )

                ],
              ),
            ),
            )
          ],
        ),

      ),
    );
  }
}
