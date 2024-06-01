// ignore_for_file: prefer_const_constructors, camel_case_types, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messhub/color/color.dart';
import 'package:messhub/presentation/admin/adminProfileEdit.dart';

class adminProfile extends StatelessWidget {
  const adminProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset('assets/adminProfile/profileBg.png',
          fit: BoxFit.cover,),
        ),
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
            
            List<String>mainImage=[];
            List<String>messName1=[];
            List<String>ownerName=[];
            List<String>contact=[];
            List<String>address=[];
            
            for(var detail in messDetails){
              messName1.add(detail['MessName']);
              mainImage.add(detail['mainImage']);
              ownerName.add(detail['OwnerName']);
              contact.add(detail['Contact']);
              address.add(detail['Address']);
              }

           
            return ListView.builder(
                      itemCount: 1, 
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                          //   CircleAvatar(
                          //   radius: 50,
                          //   backgroundImage: NetworkImage(mainImage[index]),
                          //   )
                          // ,
                          //   Text(messName1[index],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            TextButton(onPressed: (){}, child: Text('Edit profile')),
                            SizedBox(
                              height: 100,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  )
                                ),
                              ),
                            ),SizedBox(
                              height: 100,
                            ),
                            Text('ADD NEW MESS',style: TextStyle(
                              fontSize: 20,
                            ),),
                            SizedBox(
                              height: 20,
                            ),
                            CircleAvatar(
                              radius: 50,
                              child: IconButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminProfileEdit()));
                            }, icon: Icon(Icons.add_rounded,
                              color: textFieldColor,
                              size: 50,
                              )),
                            ) 
                ],
                        );
                        
                      },
                    );
        }
          },
        )
        ]
      )
    );
  }
}




