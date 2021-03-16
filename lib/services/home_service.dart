import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categoryCollection =
      FirebaseFirestore.instance.collection('Category');

  Future<List<QueryDocumentSnapshot>> getCategorization() async {
    var value = await _categoryCollection.get();
    return value.docs;
  }
}
