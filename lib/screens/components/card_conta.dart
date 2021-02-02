import 'package:SpendManager/models/conta.dart';
import 'package:SpendManager/screens/conta/conta_screen.dart';
import 'package:flutter/material.dart';

Widget cardConta(BuildContext context, Conta conta) {
  return InkWell(
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => ContaScreen(id: conta.id)));
    },
    child: Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      width: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blue,
          boxShadow: [
            BoxShadow(
                color: Color(0x100000),
                blurRadius: 10,
                spreadRadius: 4,
                offset: Offset(0.0, 8.0))
          ]),
      child: Stack(
        children: [
          Positioned(
              top: 14,
              right: 12,
              child: Text(
                conta.titulo,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              )),
          Positioned(
            top: 63,
            left: 16,
            child: Text(
              'Saldo em conta',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
          Positioned(
            top: 81,
            left: 16,
            child: Text("R\$ ${conta.saldo.toString()}",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white)),
          )
        ],
      ),
    ),
  );
}
