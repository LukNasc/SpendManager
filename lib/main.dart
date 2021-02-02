import 'package:SpendManager/screens/cadastrar_transacao/cadastrar_transacao_screen.dart';
import 'package:SpendManager/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

import './screens/cadastrar_conta/cadastrar_conta_screen.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
