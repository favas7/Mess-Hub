// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:messhub/color/color.dart';
import 'package:messhub/firebase/dataupdate.dart';
import 'package:messhub/functions/alert_box.dart';
import 'package:messhub/functions/details_edit_textfield.dart';
import 'package:messhub/widgets/bottomNavAdmin.dart';

class Detailsedit extends StatefulWidget {
  final Map<String, dynamic> data;
  final int index;
  final String id;

  Detailsedit({
    Key? key,
    required this.index,
    required this.data,
    required this.id,
  }) : super(key: key) {
    _messname.text = data['messname'];
    _ownername.text = data['owner'];
    _contact.text = data['contact'];
    _adress.text = data['address'];
    _fullplan.text = data['fullplan'];
    _twotimemeal.text = data['twotimemeal'];
    _lunchonly.text = data['lunchonly'];
    _fullplanveg.text = data['fullplanveg'];
    _twotimemealveg.text = data['twotimemealveg'];
    _lunchonlyveg.text = data['lunchonlyveg'];
  }

  @override
  State<Detailsedit> createState() => _DetailseditState();
}

final _messname = TextEditingController();
final _ownername = TextEditingController();
final _contact = TextEditingController();
final _adress = TextEditingController();
final _fullplan = TextEditingController();
final _twotimemeal = TextEditingController();
final _lunchonly = TextEditingController();
final _fullplanveg = TextEditingController();
final _twotimemealveg = TextEditingController();
final _lunchonlyveg = TextEditingController();

class _DetailseditState extends State<Detailsedit> {
  File? updatemainimage;
  File? updatenonvegimage;
  File? updatevegimage;

  Future<void> _pickImage(BuildContext context, Function(File) updateImage) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        updateImage(File(image.path));
      });
      print("Picked image path: ${image.path}");  // Add this line for debugging
    } else {
      print("No image selected");  // Add this line for debugging
    }
  }

  Future<void> _pickMainImage(BuildContext context) async {
    await _pickImage(context, (File image) {
      updatemainimage = image;
    });
  }

  Future<void> _pickNonVegImage(BuildContext context) async {
    await _pickImage(context, (File image) {
      updatenonvegimage = image;
    });
  }

  Future<void> _pickVegImage(BuildContext context) async {
    await _pickImage(context, (File image) {
      updatevegimage = image;
    });
  }

  Future<String> _uploadImage(File image) async {
    try {
      String fileName = 'images/${DateTime.now().millisecondsSinceEpoch.toString()}.jpg';
      Reference storageReference = FirebaseStorage.instance.ref().child(fileName);
      UploadTask uploadTask = storageReference.putFile(image);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadURL = await taskSnapshot.ref.getDownloadURL();
      print("Download URL: $downloadURL");  // Add this line for debugging
      return downloadURL;
    } catch (e) {
      print("Error uploading image: $e");
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar( 
        title:  Row(
          children: [
            const Text('Edit Details'),
            const Spacer(),
            IconButton(onPressed: (){
              showDeleteAlertDialog(
                context,
                "Delete Confirmation",
                "Are you sure you want to delete this Mess?",
                () {
                  deleteDocument(widget.id);
                  print("Item deleted");
                  Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const BottomNav()),
    );
                },
              );}, icon: const Icon(Icons.delete))
          ],
        )
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Login/ForgotPass.png'),
                fit: BoxFit.cover,
                opacity: .7,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      children: [
                        heading(heading: 'Mess Details'),
                        const SizedBox(height: 30),
                        detailsTextField(controller: _messname, hintText: 'Mess Name'),
                        const SizedBox(height: 30),
                        detailsTextField(controller: _ownername, hintText: 'Owner Name'),
                        const SizedBox(height: 30),
                        detailsTextField(controller: _contact, hintText: 'Contact'),
                        const SizedBox(height: 30),
                        detailsTextField(controller: _adress, hintText: 'Place'),
                        const SizedBox(height: 30),
                        heading(heading: 'NON VEG PRICE DETAILS'),
                        const SizedBox(height: 30),
                        detailsTextField(controller: _fullplan, hintText: 'Full Plan'),
                        const SizedBox(height: 30),
                        detailsTextField(controller: _twotimemeal, hintText: 'Two Times'),
                        const SizedBox(height: 30),
                        detailsTextField(controller: _lunchonly, hintText: 'Lunch Only'),
                        const SizedBox(height: 30),
                        heading(heading: 'VEG PRICE DETAILS'),
                        const SizedBox(height: 30),
                        detailsTextField(controller: _fullplanveg, hintText: 'Full Plan'),
                        const SizedBox(height: 30),
                        detailsTextField(controller: _twotimemealveg, hintText: 'Two Times'),
                        const SizedBox(height: 30),
                        detailsTextField(controller: _lunchonlyveg, hintText: 'Lunch Only'),
                        const SizedBox(height: 30),
                        heading(heading: 'Main Image'),
                        const SizedBox(height: 30),
                        updatemainimage == null
                            ? Image.network(widget.data['mainimage'])
                            : Image.file(updatemainimage!),
                        TextButton(
                          onPressed: () {
                            _pickMainImage(context);
                          },
                          style:ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(mainColor),
                          ) ,
                          child: const Text('Pick Main Image'),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        heading(heading: 'Non-Veg Image'),
                        const SizedBox(height: 30),
                        updatenonvegimage == null
                            ? Image.network(widget.data['nonvegimage'])
                            : Image.file(updatenonvegimage!),
                            
                        TextButton(
                          onPressed: () {
                            _pickNonVegImage(context);
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(mainColor),
                          ),
                          child: const Text('Pick Non-Veg Image'),
                        ),
                         const SizedBox(
                              height: 30,
                            ),
                        heading(heading: 'Veg Image'), 
                        const SizedBox(height: 30),
                        updatevegimage == null
                            ? Image.network(widget.data['vegimage'])
                            : Image.file(updatevegimage!),
                            
                        TextButton(
                          onPressed: () {
                            _pickVegImage(context);
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(mainColor),
                          ),
                          child: const Text('Pick Veg Image'),
                        ),const SizedBox(
                              height: 30,
                            ),
                        TextButton(
                          onPressed: () async {
                            String mainImageUrl;
                            String nonVegImageUrl;
                            String vegImageUrl;

                            if (updatemainimage != null) {
                              mainImageUrl = await _uploadImage(updatemainimage!);
                            } else {
                              mainImageUrl = widget.data['mainimage'];
                            }

                            if (updatenonvegimage != null) {
                              nonVegImageUrl = await _uploadImage(updatenonvegimage!);
                            } else {
                              nonVegImageUrl = widget.data['nonvegimage'];
                            }

                            if (updatevegimage != null) {
                              vegImageUrl = await _uploadImage(updatevegimage!);
                            } else {
                              vegImageUrl = widget.data['vegimage'];
                            }

                            Map<String, dynamic> messData = {
                              "MessName": _messname.text,
                              "OwnerName": _ownername.text,
                              "Contact": _contact.text,
                              "Address": _adress.text,
                              "FullPlan": _fullplan.text,
                              "TwoTimeMeal": _twotimemeal.text,
                              "LunchOnly": _lunchonly.text,
                              "FullPlanVeg": _fullplanveg.text,
                              "TwoTimeMealVeg": _twotimemealveg.text,
                              "LunchOnlyVeg": _lunchonlyveg.text,
                              "mainImage": mainImageUrl,
                              "nonVegImage": nonVegImageUrl,
                              "vegImage": vegImageUrl,
                            };
                            await updateUser(messData, widget.id);
                            print("Document updated successfully.");
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(mainColor),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(right: 50, left: 50),
                            child: Text(
                              'Update',
                              style: TextStyle(fontSize: 20,
                              color: black),
                              
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
