// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<Map<String, dynamic>?> loadUserData() async {
  try {
    // Get the current user
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      // No user is signed in
      print('No user is signed in');
      return null;
    }

    // Get the user's email
    String userEmail = currentUser.email!;

    // Reference to the document in the 'userDetails' collection where the ID is the user's email
    DocumentReference userDoc = FirebaseFirestore.instance.collection('userDetails').doc(userEmail);

    // Fetch the document
    DocumentSnapshot docSnapshot = await userDoc.get();

    if (docSnapshot.exists) {
      // Convert the document to a map and return it
      return docSnapshot.data() as Map<String, dynamic>?;
    } else {
      // Document does not exist
      print('User details not found for email: $userEmail');
      return null;
    }
  } catch (e) {
    // Handle any errors
    print('Error fetching user details: $e');
    return null;
  }
  
}
