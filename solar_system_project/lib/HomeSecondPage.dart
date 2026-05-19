
import 'package:flutter/material.dart';

import 'ContentPage.dart';

class HomeSecondPage extends StatefulWidget {
  const HomeSecondPage({super.key});

  @override
  State<HomeSecondPage> createState() => _HomeSecondPageState();
}

class _HomeSecondPageState extends State<HomeSecondPage> {
  TextEditingController _controller=TextEditingController();
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
                  margin: EdgeInsetsDirectional.fromSTEB(15, 220, 15, 0),
                  child: Center(
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: "ادخل اسمك",
                            labelStyle: TextStyle(
                              color: Colors.yellow,
                              fontWeight: FontWeight.w800,
                            ),
                            hintText: 'خالد',
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                            ),

                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 3),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 3),
                              borderRadius: BorderRadius.circular(50),

                            ),

                          ),
                          //الاسم اللي بنكتبه لون
                          style: TextStyle(color: Colors.white),
                          controller: _controller,
                        ),



                        SizedBox(height: 43),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            GestureDetector(
                              onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  ContentPage(name:_controller.text)
                              ),
                            );
                            },
                              child: Column(
                                children: [
                                  Image.asset(
                                    'images/righ.png',
                                    width: 120,
                                    height: 120,
                                  ),
                                  Text('التالي',style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                  ),
                                ],
                              ),
                            ),




                            GestureDetector(
                              onTap: () {
                                // عند الضغط على الصورة ننتقل للصفحة الثانية
                                Navigator.pop(context);
                              },
                              child: Column(
                                children: [
                                  Image.asset(
                                    'images/left.png',
                                    width: 150,
                                    height: 150,
                                  ),
                                  Text('السابق',style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),),

                                ],
                              ),
                            ),


                        ]
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
