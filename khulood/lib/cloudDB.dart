import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addResource(Map<String, dynamic> data) async {
    data['createdAt'] = FieldValue.serverTimestamp();// يحدد تاريخ حفظ البيانات

    await _db.collection('resources').add(data);
  }
}