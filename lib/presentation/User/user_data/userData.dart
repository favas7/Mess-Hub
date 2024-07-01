// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:messhub/color/color.dart';

class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}


class _UserDataState extends State<UserData> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeatMapCalendar(colorsets: {
                
              },
              defaultColor: mainColor,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}