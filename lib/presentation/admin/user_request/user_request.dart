// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messhub/color/color.dart';
import 'package:messhub/functions/sucsess_message.dart';

class UserRequest extends StatefulWidget {
  const UserRequest({super.key});

  @override
  State<UserRequest> createState() => _UserRequestState();
}

class _UserRequestState extends State<UserRequest> {
  Future<void> acceptSubscription(DocumentSnapshot subscription) async {
    try {
      // Ensure the data is a map
      var subscriptionData = subscription.data() as Map<String, dynamic>;

      // Add the subscription to the "subscribed" collection
      await FirebaseFirestore.instance.collection('subscribed').add(subscriptionData);

      // Delete the subscription from the "subscribe" collection
      await FirebaseFirestore.instance.collection('subscribe').doc(subscription.id).delete();
      
      showSuccessMessage(context, 'Subscription accepted',duration: 2);
    } catch (e) {
      showSuccessMessage(context, 'Failed to accept subscription',duration: 2);
    }
  }

  Future<void> declineSubscription(String subscriptionId) async {
    try {
      // Delete the subscription from the "subscribe" collection
      await FirebaseFirestore.instance.collection('subscribe').doc(subscriptionId).delete();
      
      showSuccessMessage(context, 'Subscription declined',duration: 2);
    } catch (e) {
      showSuccessMessage(context, 'Failed to decline subscription',duration: 2);
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Requests'),
        backgroundColor: mainColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('subscribe').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  var subscriptions = snapshot.data!.docs;

                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: subscriptions.length,
                    itemBuilder: (context, index) {
                      var subscription = subscriptions[index];
                      return ListTile(
                        title: Text(subscription['messname']),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Email: ${subscription['email']}'),
                            Text('Phone: ${subscription['phone']}'),
                            Text('Username: ${subscription['username']}'),
                          ],
                        ),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () => declineSubscription(subscription.id),
                                icon: const Icon(Icons.cancel),
                              ),
                              IconButton(
                                onPressed: () => acceptSubscription(subscription),
                                icon: const Icon(Icons.check_box_rounded),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
