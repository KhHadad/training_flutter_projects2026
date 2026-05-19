
import 'package:flutter/material.dart';
import 'package:solar_system_project/ContentPage.dart';
import 'package:solar_system_project/Eighth.dart';
import 'package:solar_system_project/Fifth.dart';
import 'package:solar_system_project/Forth.dart';
import 'package:solar_system_project/Second.dart';
import 'package:solar_system_project/Seventh.dart';
import 'package:solar_system_project/Sixth.dart';
import 'package:solar_system_project/Third.dart';

import 'First.dart';




class ChoicesPage extends StatefulWidget {
  const ChoicesPage({super.key});

  @override
  State<ChoicesPage> createState() => _ChoicesPageState();
}

class _ChoicesPageState extends State<ChoicesPage> {
//methods
  Widget elements( Widget Page,String name, String src ){
    return
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Page),
          );
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: EdgeInsets.all(60),
              height: 245,
              width: 250,
     
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                elevation: 20,
                child: Center(
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Positioned(
              top:-8,
              left: 0,
              right: 10,

              child: Center(
                child: Image.asset(
                  src,
                  height: 160,
                ),
              ),
            ),
          ],
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('لنستكشف الفضاء'),),
          backgroundColor: Colors.white24,
        ),

        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.indigo),
                child: Center(child: Text("القائمة ", style: TextStyle(color: Colors.white, fontSize: 24))),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("الرئيسية"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>
                          ContentPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text("معلومات الكواكب"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),



        body:
        SizedBox.expand(
          child: Stack(
              children:[

                Positioned.fill(
                  child: Image.asset(
                    "images/bac2.jpg",
                    fit: BoxFit.cover,

                  ),
                ),


                SingleChildScrollView(
                  child: Container(

                    margin: EdgeInsetsDirectional.fromSTEB(0, 17, 0, 0),
                    child: Column(
                      children: [
                        SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [

                            elements( First(),'كوكب عطارد',  'images/atared.png' ),
                            elements( Second(),'كوكب الزهرة',  'images/zohra.png' ),
                            elements( Third(),'كوكب الارض',  'images/earth.png' ),
                            elements( Forth(),'كوكب المريخ',  'images/mereekh.png' ),


                          ],
                        ),
                        ),




                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              elements( Fifth(),'كوكب المشتري',  'images/moshtry.png' ),
                              elements( Sixth(),'كوكب زحل',  'images/zohle.png' ),
                              elements( Seventh(),'كوكب أورانوس',  'images/oranos.png' ),
                              elements( Eighth(),'كوكب نبتون',  'images/nebton.png' ),
                            ],
                          ),
                        ),
                    ]),
                  ),
                ),
              ]),
        ),
      ),
    );

  }
}
