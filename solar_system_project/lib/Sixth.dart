import 'package:flutter/material.dart';
import 'package:solar_system_project/Template.dart';

class Sixth extends StatelessWidget {
  const Sixth({super.key});

  @override
  Widget build(BuildContext context) {
    return Template(src: 'images/zohle.png',
        number: '6',
        name: 'زحل',
        textContent: 'زحل هو ثاني أكبر كوكب ويشتهر بحلقاته المدهشة المكونة من جليد وصخور صغيرة. يتكون من الهيدروجين والهيليوم، ويملك أكثر من 80 قمرًا، أبرزها تيتان الذي يحتوي على بحيرات من الميثان السائل. كثافته منخفضة جدًا لدرجة أنه يمكن أن يطفو لو وضع في ماء ضخم، ويومه قصير جدًا إذ لا يتجاوز 10 ساعات.'

        ,colorName: Colors.brown);
  }
}