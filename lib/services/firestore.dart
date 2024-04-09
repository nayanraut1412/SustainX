import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference pickups =
  FirebaseFirestore.instance.collection('pickup');

  final CollectionReference users =
  FirebaseFirestore.instance.collection('users');

  Future<void> addPickup(DateTime time, DateTime date, String address) {
    return pickups.add({
      'date': date,
      'time': time,
      'address': address,
      'timestamp': Timestamp.now(),
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