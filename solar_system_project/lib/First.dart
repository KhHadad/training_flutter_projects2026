
import 'package:flutter/material.dart';
import 'package:solar_system_project/Template.dart';

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    return Template(src: 'images/atared.png',
        number: '1',
        name: 'عطارد',
        textContent: 'عطارد هو أقرب كوكب إلى الشمس وأصغر كواكب المجموعة الشمسية، يتميز بسطح مليء بالفوهات نتيجة اصطدام النيازك عبر الزمن. لا يملك غلافًا جويًا تقريبًا، مما يجعله عرضة لتقلبات حرارية شديدة تصل إلى 430° نهارًا وتنخفض إلى -180° ليلًا. هذا الكوكب الصغير لا يملك أي أقمار طبيعية، ويُعتبر بيئة قاسية وغير صالحة للحياة.'
        ,colorName: Colors.brown);
  }
}
