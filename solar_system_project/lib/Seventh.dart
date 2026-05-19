import 'package:flutter/material.dart';
import 'package:solar_system_project/Template.dart';

class Seventh extends StatelessWidget {
  const Seventh({super.key});

  @override
  Widget build(BuildContext context) {
    return Template(src: 'images/oranos.png',
        number: '7',
        name: 'أورانوس',
        textContent: 'أورانوس هو كوكب جليدي عملاق بلون أزرق مخضر بسبب وجود غاز الميثان في غلافه الجوي. يتميز بميله الشديد على جانبه بزاوية 98°، مما يجعله فريدًا في طريقة دورانه حول الشمس. غلافه الجوي يحتوي على الهيدروجين والهيليوم والميثان، ويملك أكثر من 25 قمرًا. متوسط درجة الحرارة فيه يصل إلى -224°. '
        ,colorName: Colors.blue);
  }
}