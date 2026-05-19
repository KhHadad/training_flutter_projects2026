
import 'package:flutter/material.dart';
import 'package:solar_system_project/Template.dart';

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    return Template(src: 'images/zohra.png',
        number: '2',
        name: 'الزهرة',
        textContent: 'الزهرة هو ثاني أقرب كوكب للشمس ويُعرف بـ "توأم الأرض" بسبب التشابه في الحجم، لكنه مختلف تمامًا في الظروف. غلافه الجوي كثيف من ثاني أكسيد الكربون ويحتوي على غيوم من حمض الكبريتيك، مما يسبب احتباسًا حراريًا شديدًا يجعله أكثر الكواكب حرارة بدرجات تصل إلى 470°. سطحه مليء بالبراكين والجبال، ولا يملك أي أقمار طبيعية.'
        ,colorName: Colors. brown);
  }
}

