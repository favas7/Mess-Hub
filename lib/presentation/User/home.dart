// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("messdetails").snapshots(),
          // initialData: initialData,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            else if(!snapshot.hasData ){
              
              return Center(child: Text('No Data Found'),);
              
            }
            else{
            List<QueryDocumentSnapshot>messDetails = snapshot.data?.docs;
            List<String>mainImage = [];
            List<String>messName=[];
            for(var detail in messDetails){
              messName.add(detail['MessName']);
              mainImage.add(detail['mainImage']);
              }

           
            return ListView.builder(
          itemCount: messName.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(24.0), 
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  ownerDetails(index: index,)),
                        );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height*0.6,
                  width: 300,
                  color: adminBg,
                  child: Column(
                    children: [
                      Text(messName[index],style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),),
                      Image.network(mainImage[index],
                      fit: BoxFit.cover,)
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
        
      ),
    );
  }
}