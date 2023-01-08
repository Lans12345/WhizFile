import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

Future addOrder(
  String name,
  String email,
  String documentType,
  String deliveryAddress,
  String courier,
  double lat,
  double long,
) async {
  String cdate3 = DateFormat("MMM, EEE, yyyy").format(DateTime.now());
  final docUser = FirebaseFirestore.instance.collection('Orders').doc();

  final json = {
    'user': {
      'name': name,
      'email': email,
      'uid': FirebaseAuth.instance.currentUser!.uid,
    },
    'uid': FirebaseAuth.instance.currentUser!.uid,
    'id': docUser.id,
    'date': cdate3,
    'documentType': documentType,
    'deliveryAddress': deliveryAddress,
    'courier': courier,
    'lat': lat,
    'long': long,
    'status': 'On Process'
  };

  await docUser.set(json);
}
