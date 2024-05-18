// ignore_for_file: file_names, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messhub/color/color.dart';

class ownerDetails extends StatefulWidget {
  final int index;
  const ownerDetails({super.key, required this.index});

  @override
  State<ownerDetails> createState() => _ownerDetailsState();
}

class _ownerDetailsState extends State<ownerDetails> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: adminBg,
      body: SafeArea(child: 
      StreamBuilder(
          stream: FirebaseFirestore.instance.collection("messdetails").snapshots(),
          // initialData: initialData,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return const CircularProgressIndicator();
            }
            else if(!snapshot.hasData ){
              
              return const Center(child: Text('No Data Found'),);
              
            }
            else{
            List<QueryDocumentSnapshot>messDetails = snapshot.data?.docs;
            List<String>vegImage = [];
            List<String>nonVegImage = [];
            List<String>messName1=[];
            List<String>ownerName=[];
            List<String>contact=[];
            List<String>address=[];
            List<String>fullPlan=[];
            List<String>twoTimeMeal=[];
            List<String>lunchOnly=[];
            for(var detail in messDetails){
              messName1.add(detail['MessName']);
              vegImage.add(detail['vegImage']);
              nonVegImage.add(detail['nonVegImage']);
              ownerName.add(detail['OwnerName']);
              contact.add(detail['Contact']);
              address.add(detail['Address']);
              fullPlan.add(detail['FullPlan']);
              twoTimeMeal.add(detail['TwoTimeMeal']);
              lunchOnly.add(detail['LunchOnly']);
              }

           
            return ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(24.0), 
              child: Container(
                color: adminBg,
                child: Column(
                  children: [
                    Text(messName1[widget.index],style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),),
                    const SizedBox(height: 20,),
                    const Text('VEG MENU',style: TextStyle(
                      fontSize: 20,
                    )),
                    const SizedBox(height: 20,),
                    Image.network(vegImage[widget.index],
                    fit: BoxFit.cover,),
                    const SizedBox(height: 20,),
                    const Text('NON VEG MENU',style: TextStyle(
                      fontSize: 20,
                      )),
                    const SizedBox(height: 20,), 
                    Image.network(nonVegImage[widget.index],
                    fit: BoxFit.cover,),
                    Text(ownerName[widget.index]),
                    Text(contact[widget.index]),
                    Text(address[widget.index]),
                    Text(fullPlan[widget.index]),
                    Text(twoTimeMeal[widget.index]),
                    Text(lunchOnly[widget.index]),
                  ],
                  
                ),
              ),
            );
            
          },
        );
        }
          },
        )),
    );
  }
  
}
