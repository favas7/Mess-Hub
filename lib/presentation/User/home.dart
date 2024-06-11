// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messhub/color/color.dart';
import 'package:messhub/presentation/User/ownerDetails.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  
  List<String>imageAsset =[];


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
                          builder: (context) => OwnerDetails(
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
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: white,
                      ),
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Image.network(
                            detail['mainImage'],
                            height: MediaQuery.of(context).size.height/3.2,
                            fit: BoxFit.fill,
                          ),
                          Positioned(
                            bottom: 100,
                            left: 16,
                            child: Text(
                              detail['MessName'],
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 60,
                            left: 0,
                            child: Row(
                              children: [
                                IconButton(onPressed: () {}, icon: const Icon(Icons.location_on)),
                                Text(details['address'],style: const TextStyle(
                                  fontWeight: FontWeight.bold
                                ),),
                                const SizedBox(width: 20,),
                                IconButton(onPressed: (){}, icon: const Icon(Icons.star,color: Colors.yellow,)),
                                const Text('3.4'),

                              ],
                            ),
                          ),
                          const Positioned(
                            bottom: 10,left: 20,
                            child: Text(' Description about the mess in detail to understand \n customer.Description about the mess in detail to \n understand ')),
                          Positioned(
                            right: 10,
                            bottom: 95,
                            child: IconButton(
                              onPressed: () {}, 
                              icon: const Icon(Icons.favorite, size: 30,color: black,
                              ),
                            ),
                          ),

                        

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