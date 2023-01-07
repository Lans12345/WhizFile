import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addUser(
  String name,
  String email,
) async {
  final docUser = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  final json = {
    'name': name,
    'email': email,
    'id': docUser.id,
    'profile': 'https://cdn-icons-png.flaticon.com/512/149/149071.png',
  };

  await docUser.set(json);
}
