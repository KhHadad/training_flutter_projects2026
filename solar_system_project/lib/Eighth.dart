import 'package:flutter/material.dart';
import 'package:solar_system_project/Template.dart';

class Eighth extends StatelessWidget {
  const Eighth({super.key});

  @override
  Widget build(BuildContext context) {
    return Template(src: 'images/nebton.png' ,
        number: '8',
        name: 'نبتون',
        textContent: 'نبتون هو أبعد كوكب عن الشمس ويتميز بلونه الأزرق العميق الناتج عن وجود الميثان. يشتهر بوجود أسرع رياح في النظام الشمسي تصل سرعتها إلى 2100 كم/ساعة. يملك 14 قمرًا، أبرزها تريتون الذي يُعتبر من أكثر الأقمار غرابة. يومه يعادل حوالي 16 ساعة، وهو كوكب بارد جدًا وظروفه قاسية للغاية.'
        ,colorName: Colors.indigo);
  }
}