import '../models/conta.dart';
import '../utils/db_util.dart';

class ContaService {
  List<Conta> _lstConta = [];
  void addConta(Conta conta) {
    DbUtil.insertData('conta', conta.toMap());
  }

  Future<List> getAllContas() async {
    final dataList = await DbUtil.getData('conta');
    _lstConta = dataList.map((contas) => Conta.fromMap(contas)).toList();
    return _lstConta;
  }

  Future<Conta> getConta(int id) async {
    String where = "id = ?";
    final dataList = await DbUtil.getDataWhere('conta', where, [id]);
    return Conta.fromMap(dataList.first);
  }

  void editSaldoConta(int id, double valor, int tipoTransacao) {
    String sql;
    if (tipoTransacao == 1) {
      sql = "UPDATE conta SET saldo = saldo + ? WHERE id = ?";
    } else {
      sql = "UPDATE conta SET saldo = saldo - ? WHERE id = ?";
    }
    List<dynamic> args = [valor, id];
    DbUtil.executeSql(sql, args);
  }
}
