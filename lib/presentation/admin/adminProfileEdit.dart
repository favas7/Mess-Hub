// ignore_for_file: camel_case_types, use_key_in_widget_constructors, file_names, unnecessary_null_comparison, prefer_const_constructors, avoid_print, use_build_context_synchronously

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:messhub/color/color.dart';
import 'package:messhub/functions/textfield.dart';

class AdminProfileEdit extends StatefulWidget {
  const AdminProfileEdit({Key? key});

  @override
  State<AdminProfileEdit> createState() => _AdminProfileEditState();
}

class _AdminProfileEditState extends State<AdminProfileEdit> {
 
 
  List<XFile>? images;
  String mainImage = "";
  String vegImage = "";
  String nonvegImage = "";
  final TextEditingController _messname = TextEditingController();
  final TextEditingController _ownername = TextEditingController();
  final TextEditingController _contact = TextEditingController();
  final TextEditingController _adress = TextEditingController();
  final TextEditingController _fullplan = TextEditingController();
  final TextEditingController _twotime = TextEditingController();
  final TextEditingController _lunch = TextEditingController();

  void _clearForm(){
    _messname.clear();
    _ownername.clear();
    _contact.clear();
    _adress.clear();
    _fullplan.clear();
    _twotime.clear();
    _lunch.clear();
  }

  


    // Your code to add mess details to Firestore
    Future addMessDetails (Map<String, dynamic> messInfoMap) async 
    {
      return await FirebaseFirestore.instance
      .collection("messdetails")
      .add(messInfoMap);
      }

      mainImagepicker() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file == null) {
      return;
    }
    String filename = DateTime.now().microsecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImage = referenceRoot.child('MainImage');
    Reference referenceDirImagtoupload = referenceDirImage.child(filename);
    try {
      await referenceDirImagtoupload.putFile(File(file.path));
      mainImage = await referenceDirImagtoupload.getDownloadURL();
      setState(() {});
      if (mainImage.isEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('No Image Selected')));
      }
    } catch (e) {
      print('Some Error Happened ?');
    }
  }vegImagepicker() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file == null) {
      return;
    }
    String filename = DateTime.now().microsecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImage = referenceRoot.child('Veg');
    Reference referenceDirImagtoupload = referenceDirImage.child(filename);
    try {
      await referenceDirImagtoupload.putFile(File(file.path));
      vegImage = await referenceDirImagtoupload.getDownloadURL();
      setState(() {});
      if (vegImage.isEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('No Image Selected')));
      }
    } catch (e) {
      print('Some Error Happened ?');
    }
  }nonvegImagepicker() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file == null) {
      return;
    }
    String filename = DateTime.now().microsecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImage = referenceRoot.child('NonVeg');
    Reference referenceDirImagtoupload = referenceDirImage.child(filename);
    try {
      await referenceDirImagtoupload.putFile(File(file.path));
      nonvegImage = await referenceDirImagtoupload.getDownloadURL();
      setState(() {});
      if (nonvegImage.isEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('No Image Selected')));
      }
    } catch (e) {
      print('Some Error Happened ?');
    }
  }

  


void showSuccessMessage(BuildContext context, String message, {int duration = 2}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: mainColor,
    textColor: white,
    fontSize: 16.0,
    timeInSecForIosWeb: duration, // Duration in seconds
  );
}

// @override
//   void initState() {
//     super.initState();
//     _messname.text = ;
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: adminBg,
      body: SafeArea(
        child: StreamBuilder<Object>(
          stream: FirebaseFirestore.instance.collection("messdetails").snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            else if(!snapshot.hasData ){
              
              return Center(child: Text('No Data Found'),);
              
            }
            else{
            List<QueryDocumentSnapshot>messDetails = snapshot.data?.docs;
            List<String>mainImageData = [];
            List<String>messName=[];
            List<String>vegImageData = [];
            List<String>nonVegImageData = [];
            List<String>ownerName=[];
            List<String>contact=[];
            List<String>address=[];
            List<String>fullPlan=[];
            List<String>twoTimeMeal=[];
            List<String>lunchOnly=[];
            for(var detail in messDetails){
              messName.add(detail['MessName']);
              mainImageData.add(detail['mainImage']);
              vegImageData.add(detail['vegImage']);
              nonVegImageData.add(detail['nonVegImage']);
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
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'ADMIN',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 3,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(28.0), 
                        child: GestureDetector(
                          onTap: () {
                            mainImagepicker();
                          },
                          child: Image.asset("assets/PlaceHolder/Placeholder_view_vector.svg.png"),
                        ),
                      ),
                      Positioned(
                        left: 55,
                        top: 150,
                        child: InkWell(
                          onTap: () {},
                          child: const Text(
                            'PLEASE TAP TO UPLOAD MESS PROFILE',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      // Positioned(left: 180,top: 310,
                      //   child: TextButton(onPressed: (){}, child: Text("EDIT",style: TextStyle(
                      //     color: mainColor
                      //   ),))),
                      Padding(
                        padding: EdgeInsets.all(28),
                        child: mainImageData.isNotEmpty
                            ? SizedBox(
                                width: double.infinity,
                                height: 290,
                                child: Image.network(mainImageData[index],
                                fit: BoxFit.cover)
                                
            
                              )
                            : const SizedBox(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 1.7,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customTextField(
                                  labelText: 'Name of mess owner',
                                  controller: _ownername,
                                ),
                                const SizedBox(height: 20),
                                customTextField(
                                  labelText: 'Name of mess',
                                  controller: _messname,
                                ),
                                const SizedBox(height: 20),
                                customTextField(
                                  textInputType: TextInputType.numberWithOptions(),
                                  labelText: 'Contact',
                                  controller: _contact,
                                ),
                                const SizedBox(height: 20),
                                customTextField(
                                  labelText: 'Address',
                                  controller: _adress,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 3,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 110,
                        top: 60,
                        child: IconButton(
                          onPressed: () {
                            vegImagepicker();
                          },
                          icon: const Icon(Icons.add),
                          iconSize: 150,
                          color: mainColor,
                        ),
                      ),
                      Positioned(
                        left: 100,
                        top: 230,
                        child: InkWell(
                          onTap: () {},
                          child: const Text(
                            'ADD IMAGE OF VEG MENU',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(28),
                        child: vegImageData.isNotEmpty 
                            ? SizedBox(
                                width: double.infinity,
                                height: 290,
                                child: Image.network(
                                  vegImageData[index],
                                  fit: BoxFit.cover,
                                ),
                              )
                            : const SizedBox(),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 3,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 110,
                        top: 60,
                        child: IconButton(
                          onPressed: () {
                            nonvegImagepicker();
                          },
                          icon: const Icon(Icons.add),
                          iconSize: 150,
                          color: mainColor,
                        ),
                      ),
                      Positioned(
                        left: 100,
                        top: 230,
                        child: InkWell(
                          onTap: () {},
                          child: const Text(
                            'ADD IMAGE OF NON VEG MENU',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(28),
                        child: nonVegImageData.isNotEmpty
                            ? SizedBox(
                                width: double.infinity,
                                height: 290,
                                child: Image.network(
                                  nonVegImageData[index],
                                  fit: BoxFit.cover, 
                                ),
                              )
                            : const SizedBox(),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Price(/Month)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2.5,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            customTextField(
                              labelText: 'Full Plan',
                              controller: _fullplan,
                              textInputType: TextInputType.numberWithOptions()
                            ),
                            customTextField(
                              labelText: 'Breakfast And Dinner',
                              controller: _twotime,
                              textInputType: TextInputType.numberWithOptions()
                            ),
                            customTextField(
                              labelText: 'Lunch Only',
                              controller: _lunch,
                              textInputType: TextInputType.numberWithOptions()
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
            }
            );
        }
          },
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Map<String, dynamic>  messData = {
    "MessName" : _messname.text,
    "OwnerName": _ownername.text,
    "Contact" : _contact.text,
    "Address" : _adress.text,
    "FullPlan" : _fullplan.text,
    "TwoTimeMeal" : _twotime.text,
    "LunchOnly" : _lunch.text,
    "mainImage" : mainImage ,
    "vegImage" : vegImage ,
    "nonVegImage" : nonvegImage,
  };
          if(
            mainImage.isEmpty &&
            vegImage.isEmpty &&
            nonvegImage.isEmpty
          ){
            showSuccessMessage(context, "Mess Images Required", duration: 2);
          }
          else if(messData["MessName"].isNotEmpty && 
          messData["OwnerName"].isNotEmpty && 
          messData["Contact"].isNotEmpty && 
          messData["Address"].isNotEmpty&& 
          messData["FullPlan"].isNotEmpty && 
          messData["TwoTimeMeal"].isNotEmpty && 
          messData["LunchOnly"].isNotEmpty){
            addMessDetails(messData);
            showSuccessMessage(context, "Data added successfully!", duration: 2);
            setState(() {
              _clearForm();
            });
          }
          else{
            showSuccessMessage(context, "All fields are required", duration: 2);
          }
          
          },
        child: const Icon(Icons.save),
      ),
    );
  }

}