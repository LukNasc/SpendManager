import 'package:SpendManager/screens/conta/components/body.dart';
import 'package:flutter/material.dart';

class ContaScreen extends StatelessWidget {
  final int id;

  ContaScreen({this.id});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(id: this.id),
    );
  }
}