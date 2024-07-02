import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference pickups =
  FirebaseFirestore.instance.collection('pickup');

  final CollectionReference users =
  FirebaseFirestore.instance.collection('users');

  Future<void> addPickup(DateTime time, DateTime date, String address) {
    String isoTimeString = time.toIso8601String();
    String isoDateString = date.toIso8601String();

    return pickups.add({
      'date': isoDateString,
      'time': isoTimeString,
      'address': address,
      'timestamp': FieldValue.serverTimestamp(),
      'status': "Pending",
    });
  }

  Future<void> addUser(String fullName, String phoneNo, String address, String email) {
    return users.add({
      'full name': fullName,
      'phone no': phoneNo,
      'address': address,
      'email': email,
    });
  }
}