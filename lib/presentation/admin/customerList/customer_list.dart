import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messhub/color/color.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({super.key});

  @override
  State<CustomerList> createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer List'),
        backgroundColor: mainColor,
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('subscribed').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData) {
              return const Center(child: Text('No data available'));
            }

            var customers = snapshot.data!.docs;

            return ListView.separated(
              padding: const EdgeInsets.all(16.0),
              itemCount: customers.length,
              itemBuilder: (context, index) {
                var customer = customers[index];
                var data = customer.data() as Map<String, dynamic>;

                return ListTile(
                  title: Text(data['username'] ?? 'No username'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email: ${data['useremail'] ?? 'No email'}'), 
                      Text('Phone: ${data['phone'] ?? 'No phone'}'),
                    ],
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
      ),
    );
  }
}
