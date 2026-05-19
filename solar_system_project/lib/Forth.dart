import 'package:flutter/material.dart';
import 'package:solar_system_project/Template.dart';

class Forth extends StatelessWidget {
  const Forth({super.key});

  @override
  Widget build(BuildContext context) {
    return Template(src: 'images/mereekh.png',
        number: '4',
        name: 'المريخ',
        textContent: 'المريخ يُعرف بالكوكب الأحمر بسبب أكسيد الحديد الذي يغطي سطحه. يتميز بوجود أضخم بركان في المجموعة الشمسية وهو "أوليمبوس مونز"، كما أن غلافه الجوي رقيق ومعظمه من ثاني أكسيد الكربون. يملك قمرين صغيرين هما فوبوس وديموس، ويُعتبر من أكثر الكواكب المرشحة لاستكشاف البشر مستقبلًا بسبب تشابهه النسبي مع الأرض.'
        ,colorName: Colors.redAccent);
  }
}