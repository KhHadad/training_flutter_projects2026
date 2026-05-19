import 'package:flutter/material.dart';
import 'cloudDB.dart';

class AddResources extends StatefulWidget {
  const AddResources({super.key});

  @override
  State<AddResources> createState() => _AddResourcesState();
}

class _AddResourcesState extends State<AddResources> {
  final FirebaseService firebaseService = FirebaseService();

  // مفتاح النموذج للتحقق من البيانات
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final linkController = TextEditingController();
  final descriptionController = TextEditingController();

  String resourceType = 'كورس';

  @override
  void dispose() {
    titleController.dispose();
    linkController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FE),
        appBar: AppBar(
          backgroundColor: const Color(0xFF3F51B5),
          elevation: 0,
          title: const Text(
            "إضافة مورد جديد",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form( // تغليف الحقول بـ Form
            key: _formKey,
            child: Column(
              children: [
                // الهيدر
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("أضف كورس أو موقع مفيد", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF3F51B5))),
                            SizedBox(height: 8),
                            Text("سجل رابط مورد تعليمي ليستفيد منه الجميع ✨", style: TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      ),
                      const Icon(Icons.menu_book, size: 40, color: Color(0xFF3F51B5))
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // كارد البيانات
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, spreadRadius: 2)],
                  ),
                  child: Column(
                    children: [
                      // حقل الاسم مع التحقق
                      buildTextField(
                        "الاسم",
                        "مثال: كورس فلاتر للمبتدئين",
                        Icons.edit_note,
                        controller: titleController,
                        validator: (value) {
                          if (value == null || value.isEmpty) return "الرجاء إدخال الاسم";
                          if (value.length < 3) return "الاسم يجب أن يكون أكثر من 3 أحرف";
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),

                      // حقل الرابط مع التحقق (Regex)
                      buildTextField(
                        "الرابط",
                        "https://example.com",
                        Icons.link,
                        controller: linkController,
                        keyboardType: TextInputType.url,
                        validator: (value) {
                          if (value == null || value.isEmpty) return "الرجاء إدخال الرابط";
                          bool isUrl = Uri.tryParse(value)?.hasAbsolutePath ?? false;
                          if (!isUrl) return "يرجى إدخال رابط صحيح يبدأ بـ http أو https";
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // اختيار النوع
                      Row(
                        children: [
                          const Icon(Icons.category_outlined, color: Color(0xFF3F51B5), size: 20),
                          const SizedBox(width: 10),
                          const Text("النوع", style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(child: typeButton("كورس", Icons.school, resourceType == 'كورس')),
                          const SizedBox(width: 10),
                          Expanded(child: typeButton("موقع", Icons.language, resourceType == 'موقع')),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // حقل الوصف
                      buildTextField(
                        "الوصف",
                        "اكتب وصفاً مختصراً (اختياري)...",
                        Icons.description,
                        maxLines: 3,
                        controller: descriptionController,
                        validator: (value) {
                          if (value != null && value.isNotEmpty && value.length < 10) {
                            return "الوصف قصير جداً (10 أحرف على الأقل)";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // زر الحفظ
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      // تشغيل عملية التحقق قبل الحفظ
                      if (_formKey.currentState!.validate()) {
                        await saveResource();
                      }
                    },
                    icon: const Icon(Icons.save_outlined),
                    label: const Text("حفظ المورد", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3F51B5),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // دالة الحفظ
  Future<void> saveResource() async {
    Map<String, dynamic> data = {
      'title': titleController.text.trim(),
      'link': linkController.text.trim(),
      'type': resourceType,
    };

    if (descriptionController.text.trim().isNotEmpty) {
      data['description'] = descriptionController.text.trim();
    }

    try {
      await firebaseService.addResource(data);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("تم حفظ المورد بنجاح!")));
        Navigator.pop(context);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("خطأ أثناء الحفظ: $e")));
    }
  }

  // ودجت الحقل النصي المطور
  Widget buildTextField(
      String label,
      String hint,
      IconData icon,
      {int maxLines = 1,
        required TextEditingController controller,
        TextInputType keyboardType = TextInputType.text,
        String? Function(String?)? validator,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: const Color(0xFF3F51B5), size: 20),
            const SizedBox(width: 10),
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          validator: validator,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.grey[50],
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey[200]!)),
          ),
        ),
      ],
    );
  }

  Widget typeButton(String title, IconData icon, bool isSelected) {
    return GestureDetector(
      onTap: () => setState(() => resourceType = title),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF3F51B5) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF3F51B5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isSelected ? Colors.white : const Color(0xFF3F51B5), size: 18),
            const SizedBox(width: 8),
            Text(title, style: TextStyle(color: isSelected ? Colors.white : const Color(0xFF3F51B5), fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}