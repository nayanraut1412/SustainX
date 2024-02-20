import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference pickups =
  FirebaseFirestore.instance.collection('pickup');

  Future<void> addPickup(DateTime time, DateTime date, String address) {
    return pickups.add({
      'date': date,
      'time': time,
      'address': address,
      'timestamp': Timestamp.now(),
    });
  }
}