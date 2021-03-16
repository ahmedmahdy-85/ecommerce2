import 'package:cloud_firestore/cloud_firestore.dart';

class BestSellingService {
  final CollectionReference _bestSellingCollection =
      FirebaseFirestore.instance.collection('Best_Selling');

  Future<List<QueryDocumentSnapshot>> getProducts() async {
    var value = await _bestSellingCollection.get();
    return value.docs;
  }
}
