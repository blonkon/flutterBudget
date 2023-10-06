import 'dart:js_interop';

import 'package:flutter/material.dart';


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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
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
                Positioned(
                  bottom: -50.0,
                  child: InkWell(
                    child: CircleAvatar(
                      radius: 75,
                      backgroundColor: Colors.white,
                      child: ClipRRect(
                        child: Image.asset("images/user1.jpg"),
                      ),
                    ),
                  ),
                ),
              ]),
            const SizedBox(
              height: 55,
            ),
            const Padding(padding: EdgeInsets.all(10.0),
            child: Padding(
              padding: EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Card(
                    elevation: 4,
                    child: ListTile(
                      leading: Icon(
                        Icons.add_business_sharp,
                        color: Colors.grey,
                      ),
                      title: Text("FOMBASouleymane"),
                    ),
                  )
                ],
              ),
            ),)
          ],
        ),
      ),
    );
  }
}
