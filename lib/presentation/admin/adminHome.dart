// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messhub/color/color.dart';
import 'package:messhub/presentation/admin/adminEdit.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: adminBg,
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("messdetails").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No Data Found'));
          } else {
            List<QueryDocumentSnapshot> messDetails = snapshot.data!.docs;
            return ListView.builder(
              itemCount: messDetails.length,
              itemBuilder: (BuildContext context, int index) {
                var detail = messDetails[index];
                var details = {
                  'messname': detail['MessName'],
                  'owner': detail['OwnerName'],
                  'contact': detail['Contact'],
                  'address': detail['Address'],
                  'fullplan': detail['FullPlan'],
                  'twotimemeal': detail['TwoTimeMeal'],
                  'lunchonly': detail['LunchOnly'],
                  'mainimage': detail['mainImage'],
                  'vegimage': detail['vegImage'],
                  'nonvegimage': detail['nonVegImage'],
                };
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminDetailsEdit(
                            index: index,
                            data: details, 
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 15,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
                        color: white
                      ),
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: double.infinity,
                      
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 85,top: 30 ),
                            child: Image.network(
                              detail['mainImage'],
                              fit: BoxFit.contain,   
                            ),
                          ),Positioned(
                            bottom: 30 ,left: 110,
                            child: Text(
                              detail['MessName'],
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            
                          ),
                          Positioned(
                            bottom: 0,
                            child: Row(
                              children: [
                                IconButton(onPressed: (){}, icon: const Icon(Icons.location_on)),
                            Text(details['address']) 
                              ],
                            ),
                          )
                          
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
