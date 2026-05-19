import 'package:flutter/material.dart';
import 'package:solar_system_project/Template.dart';

class Fifth extends StatelessWidget {
  const Fifth({super.key});

  @override
  Widget build(BuildContext context) {
    return Template(src: 'images/moshtry.png',
        number: '5',
        name: 'المشتري',
        textContent: 'المشتري هو أكبر كواكب المجموعة الشمسية ويتكون أساسًا من الهيدروجين والهيليوم. يتميز بوجود "البقعة الحمراء العظيمة"، وهي عاصفة هائلة مستمرة منذ قرون. يملك أكثر من 90 قمرًا، أبرزها غانيميد الذي يُعد أكبر قمر في النظام الشمسي. كما يمتلك مجالًا مغناطيسيًا قويًا جدًا يجعله مميزًا عن باقي الكواكب.'

        ,colorName: Colors.brown);
  }
}