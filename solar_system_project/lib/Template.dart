import 'package:flutter/material.dart';

class Template extends StatelessWidget {
  final String src,
         number,
         name,
         textContent;
  final Color colorName;

  const Template({super.key, required this.src, required this.number,
    required this.name, required this.textContent, required this.colorName});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
    body: Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, // النصوص تبدأ من اليمين
      children: [
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // الصورة والرقم في يمين الصفحة
      children: [
      Image.asset(
      src,
      width: 300,
      height: 250,
      ),

         Text(
          number,
          style: TextStyle(
            fontSize: 160,
            color: Colors.grey[400], // رمادي فاتح
          ),
                 ),
      ],
      ),

      SizedBox(height: 10),

      Text(
      name,
      style: TextStyle(fontSize: 59,
          fontWeight: FontWeight.w700,
      color: colorName),
      ),
        SizedBox(height: 10),
        Text(textContent, style: TextStyle(fontSize: 20,
          fontWeight: FontWeight.bold,)
        ),

        SizedBox(height: 56),

          Center(
            child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(24),
                  backgroundColor: Colors.black,
                ),
                    onPressed: () {
                    Navigator.pop(context);
                    },
                   child: Text('العودة'
                   ,style: TextStyle(color: Colors.white
                     , fontSize: 23),
                   ),
                  ),
          )
      ],
      ),
      ),
    ),
    );
    }
    }
