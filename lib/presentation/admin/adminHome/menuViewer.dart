// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Menuviewer extends StatelessWidget {
  final int index;
  final Map<String, dynamic> data;

  const Menuviewer({Key? key, required this.index, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Viewer'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('VEG MENU',style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,

            ),),
            const SizedBox(
              height: 30,
            ),
            Image.network(data['nonvegimage']), 
            const SizedBox(
              height: 50,
            ),
            const Text('NON VEG MENU',style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              
            ),),
            const SizedBox(
              height: 30,
            ),
            Image.network(data['vegimage'])
          
          ],
        ),
      ),
    );
  }
}
