// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore=FirebaseFirestore.instance;

updateUser( Map<String, dynamic> data,String docid) async {
    try {
      await firestore.collection('messdetails').doc(docid).update(data);
      print('Document updated successfully');
    } catch (e) {
      print('Error updating document: $e');
    }
  }

deleteDocument(String docId) async {
  try {
    await FirebaseFirestore.instance
        .collection('messdetails')
        .doc(docId)
        .delete();
    print("Document deleted successfully.");
  } catch (e) {
    print("Error deleting document: $e");
  }
}
