import 'package:SpendManager/models/transacao.dart';
import 'package:SpendManager/services/conta_service.dart';
import 'package:SpendManager/utils/db_util.dart';

class TransacaoService {
  List<Transacao> _lstTransacao;
  ContaService cs = ContaService();

  void addTransacao(Transacao transacao) {
    DbUtil.insertData("transacao", transacao.toMap());
    cs.editSaldoConta(transacao.conta, transacao.valor, transacao.tipo);
  }

  Future<List> getAllTransacoes() async {
    final dataList = await DbUtil.getData("transacao");
    _lstTransacao =
        dataList.map((transacao) => Transacao.fromMap(transacao)).toList();
    return _lstTransacao;
  }

  Future<List> getTransacoesConta(int id) async {
    String where = "conta = ?";
    final dataList = await DbUtil.getDataWhere("transacao", where, [id]);
    _lstTransacao =
        dataList.map((transacao) => Transacao.fromMap(transacao)).toList();
    return _lstTransacao;
  }
}
