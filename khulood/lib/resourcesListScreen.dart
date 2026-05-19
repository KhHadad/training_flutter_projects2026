import 'dart:ui'; // مهم جداً للسكرول في الويب
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:khulood/addResources.dart'; // تأكد من صحة المسار

class ResourcesView extends StatefulWidget {
  const ResourcesView({super.key});

  @override
  State<ResourcesView> createState() => _ResourcesViewState();
}

class _ResourcesViewState extends State<ResourcesView> {
  // الحالة الافتراضية للفلترة
  String selectedType = 'الكل';

  // الكنترولر الخاص بالسكرول في الويب
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose(); // تنظيف الكنترولر عند إغلاق الصفحة
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ScrollConfiguration(
        // حل مشكلة السحب بالماوس في الويب
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
            PointerDeviceKind.trackpad,
          },
        ),
        child: Scaffold(
          backgroundColor: const Color(0xFFF8F9FE),
          appBar: AppBar(
            backgroundColor: const Color(0xFF3F51B5),
            elevation: 0,
            title: const Text(
              "الموارد التعليمية",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              const SizedBox(height: 20),

              // 1. شريط التصنيفات (التصفية)
              SizedBox(
                height: 45,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  children: [
                    categoryChip("الكل"),
                    categoryChip("كورس"),
                    categoryChip("موقع"),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // 2. عرض البيانات من الفايربيس
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: selectedType == 'الكل'
                      ? FirebaseFirestore.instance
                      .collection('resources')
                      .orderBy('createdAt', descending: true)
                      .snapshots()
                      : FirebaseFirestore.instance
                      .collection('resources')
                      .where('type', isEqualTo: selectedType)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Text("لا توجد موارد متوفرة حالياً"),
                      );
                    }

                    final docs = snapshot.data!.docs;

                    return ListView.builder(
                      controller: _scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        final data = docs[index].data() as Map<String, dynamic>;

                        return resourceCard(
                          data['title'] ?? 'بدون اسم',
                          data['type'] ?? '',
                          data['link'] ?? '',
                          data['description'] ?? '',
                          data['type'] == 'كورس' ? Icons.school : Icons.language,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AddResources()),
              );
            },
            backgroundColor: const Color(0xFF3F51B5),
            child: const Icon(Icons.add, color: Colors.white, size: 30),
          ),
        ),
      ),
    );
  }

  // --- الدوال الفرعية (الموجودة داخل الكلاس لتعمل مع setState) ---

  Widget categoryChip(String label) {
    bool isSelected = selectedType == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedType = label;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF3F51B5) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF3F51B5).withOpacity(0.2)),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFF3F51B5),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget resourceCard(String title, String type, String url, String description, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF3F51B5).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF3F51B5), size: 30),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 2),
                Text(type, style: TextStyle(color: const Color(0xFF3F51B5), fontSize: 11, fontWeight: FontWeight.w600)),
                if (description.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey[600], fontSize: 13, height: 1.3),
                  ),
                ],
              ],
            ),
          ),
          IconButton(
            onPressed: () => openLink(url),
            icon: const Icon(Icons.open_in_new, color: Color(0xFF3F51B5), size: 20),
          ),
        ],
      ),
    );
  }

  void openLink(String url) async {
    if (url.isEmpty) return;
    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }
}