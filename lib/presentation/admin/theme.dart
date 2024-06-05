import 'package:flutter/material.dart';

class Themes extends StatelessWidget {
  const Themes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.abc))
          ],
        ),
      ),
    );
  }
}