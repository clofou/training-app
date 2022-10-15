import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:training_app/model/user.dart';

Future<void> addUser(User a) async {
  final col = FirebaseFirestore.instance.collection('users').doc();
  a.id = col.id;
  await col.set(a.toMap());
}

Future update(User newUser) async {
  final col = FirebaseFirestore.instance.collection("users").doc(newUser.id);
  await col.update(newUser.toMap());
}

Future delete(String id) async {
  final a = FirebaseFirestore.instance.collection("users").doc(id);
  await a.delete();
}

CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('users');

Future<List<User>> getData() async {
  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _collectionRef.get();

  // Get data from docs and convert map to List
  final allData = querySnapshot.docs
      .map((doc) => User.fromJson(doc.data() as Map<String, dynamic>))
      .toList();

  return allData;
}
