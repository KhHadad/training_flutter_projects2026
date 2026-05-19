import 'package:flutter/material.dart';
import 'package:solar_system_project/Template.dart';

class Third extends StatelessWidget {
  const Third({super.key});

  @override
  Widget build(BuildContext context) {
    return Template(src: 'images/earth.png',
        number: '3',
        name: 'الأرض',
        textContent: 'الأرض هي الكوكب الوحيد المعروف بوجود حياة، حيث يغطي الماء السائل حوالي 71% من سطحها. غلافها الجوي غني بالأكسجين والنيتروجين، مما يوفر بيئة مناسبة للكائنات الحية. يملك قمرًا واحدًا هو "القمر"، الذي يلعب دورًا مهمًا في المد والجزر. متوسط درجة الحرارة حوالي 15°، مما يجعلها بيئة معتدلة مقارنة ببقية الكواكب.'
        ,colorName: Colors.indigo);
  }
}
