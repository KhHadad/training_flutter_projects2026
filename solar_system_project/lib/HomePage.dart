
import 'package:flutter/material.dart';

import 'HomeSecondPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SizedBox.expand(
          child: Stack(
            children: [

              Positioned.fill(
                child: Image.asset(
                  "images/background1.jpg",
                  fit: BoxFit.cover,

                ),
              ),

              // المحتوى فوق الخلفية
              SafeArea(
                child: Container(


                  margin: EdgeInsetsDirectional.fromSTEB(15, 250, 15, 0),
                  child: Center(
                    child: Column(

                      children: [
                        Text(
                          "دعنا نكتشف كواكب المجموعة الشمسية",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {
                            // عند الضغط على الصورة ننتقل للصفحة الثانية
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomeSecondPage()),
                            );
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'images/righ.png',
                                width: 150,
                                height: 150,
                              ),
                              Text('التالي',style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),)
                            ],
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );


  }
}
