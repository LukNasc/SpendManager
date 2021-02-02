import 'package:SpendManager/screens/transacao/components/body.dart';
import 'package:flutter/material.dart';

class TransacaoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
        body: Body(),
    );
  }
}