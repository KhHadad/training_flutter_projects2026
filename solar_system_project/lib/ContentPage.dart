
import 'package:flutter/material.dart';
import 'package:solar_system_project/ChoicesPage.dart';

class ContentPage extends StatefulWidget {
   final String name;
  const ContentPage({super.key,this.name=''})
   ;


  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
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
                  Navigator.pop(context); // يغلق الـ Drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text("معلومات الكواكب"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>
                      ChoicesPage()));
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
              child: Column(
                children: [
                  Image.asset(
                    "images/solar-system.png",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300,
                  ),

                Text('مرحبا ${widget.name}',

                style: TextStyle(
                    fontSize: 58,
                      color: Colors.white
                  ),
                  ),
                SizedBox(height: 10),
                  Text('تخيّل أنك تنطلق في رحلة عبر الفضاء، تبدأ من وهج الشمس الذي يضيء كل شيء من حولها.'
                      ' تمرّ سريعاً بجوار عطارد الصغير، ثم تلمح الأرض، موطننا الأزرق الجميل، بين ملايين النجوم. '
                      'ومع كل محطة، تزداد دهشتك أمام المشتري العملاق وزُحل بحلقاته المذهلة.'
                      ' وفي أقصى الحدود، يظهر بلوتو الذي كان يُعتبر الكوكب التاسع قبل أن يُعاد تصنيفه ككوكب قزم، ليضيف لمسة من الغموض والجدل إلى هذه المغامرة الكونية. إنها قصة لا تنتهي من أسرار وألغاز، تنتظر من يكتشفها خطوة بخطوة.'
                      ,
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white
                    ),

                  ),
                  SizedBox(height: 20),
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                    ChoicesPage()));
                  }, child: Text('لنكتشف الكواكب'))
                  ,
                  SizedBox(height: 20),
                ],
              ),
            ),
          ]),
       ),
      ),
    );

  }
}
