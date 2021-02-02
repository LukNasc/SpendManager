import 'package:SpendManager/models/conta.dart';
import 'package:SpendManager/models/transacao.dart';
import 'package:SpendManager/screens/cadastrar_conta/cadastrar_conta_screen.dart';
import 'package:SpendManager/screens/home/home_screen.dart';
import 'package:SpendManager/services/conta_service.dart';
import 'package:SpendManager/services/transacao_service.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class CadastrarTransacaoScreen extends StatefulWidget {
  final int tipoTransacao;

  CadastrarTransacaoScreen({this.tipoTransacao});

  @override
  _CadastrarTransacaoState createState() => _CadastrarTransacaoState();
}

class _CadastrarTransacaoState extends State<CadastrarTransacaoScreen> {
  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _valorController = TextEditingController();
  final _dataController = TextEditingController();

  Conta _contaSelecionada;
  ContaService cs = ContaService();
  Future<List> _loadContas;
  List<Conta> _contas;
  DateTime _selectedDate = DateTime.now();
  TransacaoService ts = TransacaoService();

  @override
  void initState() {
    // TODO: implement initState
    _loadContas = _getContas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tipoTransacao == 1
            ? "Cadastro de entrada"
            : "Cadastro de saida"),
        backgroundColor: widget.tipoTransacao == 1 ? Colors.green : Colors.red,
      ),
      body: FutureBuilder(
        future: _loadContas,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            _contas = snapshot.data;
            return SingleChildScrollView(
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
                        controller: _descricaoController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: 'Descrição')),
                    TextFormField(
                        controller: _valorController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Valor')),
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child: AbsorbPointer(
                        child: TextFormField(
                            controller: _dataController,
                            decoration: InputDecoration(
                                labelText: formatDate(
                                    _selectedDate, [dd, '/', mm, '/', yyyy]))),
                      ),
                    ),
                    DropdownButtonFormField(
                        value: _contaSelecionada,
                        onChanged: (conta) {
                          setState(() {
                            _contaSelecionada = conta;
                          });
                        },
                        items: _contas.map((conta) {
                          return DropdownMenuItem<Conta>(
                            value: conta,
                            child: Text(conta.titulo),
                          );
                        }).toList(),
                        decoration: InputDecoration(labelText: 'Conta')),
                    Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Container(
                            height: 40,
                            width: double.infinity,
                            child: RaisedButton(
                              onPressed: () {
                                Transacao newTransacao = Transacao(
                                    titulo: _tituloController.text,
                                    descricao: _descricaoController.text,
                                    tipo: widget.tipoTransacao,
                                    valor: double.parse(_valorController.text),
                                    data: _selectedDate.toString(),
                                    conta: _contaSelecionada.id);

                                ts.addTransacao(newTransacao);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => HomeScreen()));
                              },
                              color: widget.tipoTransacao == 1
                                  ? Colors.green
                                  : Colors.red,
                              child: Text(
                                "Cadastrar",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            )))
                  ],
                ),
              ),
            ));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List> _getContas() async {
    return await cs.getAllContas();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2018, 01),
        lastDate: DateTime(2030, 01));

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
}
