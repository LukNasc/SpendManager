import 'package:SpendManager/screens/home/components/body.dart';
import 'package:SpendManager/screens/home/components/speed_dial.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      floatingActionButton: buildSpeedDial(context),
    );
  }
}
