import 'package:SpendManager/screens/home/home_screen.dart';
import 'package:SpendManager/services/conta_service.dart';
import 'package:flutter/material.dart';
import '../../models/conta.dart';

class CadastrarContaScreen extends StatelessWidget {
  final _tituloController = TextEditingController();
  final _saldoController = TextEditingController();

  ContaService cs = ContaService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Cadastro de conta"), backgroundColor: Colors.blue),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                      controller: _tituloController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(labelText: 'Titulo')),
                  TextFormField(
                      controller: _saldoController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Saldo')),
                  Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        child: RaisedButton(
                            onPressed: () {
                              Conta newConta = Conta(
                                  titulo: _tituloController.text,
                                  saldo: double.parse(_saldoController.text));

                              cs.addConta(newConta);
                               Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => HomeScreen()));
                            },
                            color: Colors.blue,
                            child: Text(
                              "Cadastrar",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )),
                      ))
                ]),
          ),
        ),
      ),
    );
  }
}
