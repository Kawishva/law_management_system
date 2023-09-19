import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

// ignore: must_be_immutable
class HoomeScreen extends StatefulWidget {
  int userID;
  final Isar isarDBInstance;

  HoomeScreen({super.key, required this.userID, required this.isarDBInstance});

  @override
  State<HoomeScreen> createState() => _HoomeScreenState();
}

class _HoomeScreenState extends State<HoomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
