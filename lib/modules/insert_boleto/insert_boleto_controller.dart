import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yobills/shared/models/boleto_model.dart';
import 'package:dio/dio.dart';

class InsertBoletoController {
  Dio dio = Dio();
  final formKey = GlobalKey<FormState>();
  BoletoModel model = BoletoModel();
  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;
  String? validateVencimento(String? value) =>
      value?.isEmpty ?? true ? "A data de vencimento não pode ser vazio" : null;
  String? validateValor(double value) =>
      value == 0 ? "Insira um valor maior que R\$ 0,00" : null;
  String? validateCodigo(String? value) =>
      value?.isEmpty ?? true ? "O código do boleto não pode ser vazio" : null;

  void onChange(
      {String? name, String? dueDate, double? value, String? barcode}) {
    model = model.copyWith(
        name: name, dueDate: dueDate, barcode: barcode, value: value);
  }

  Future<void> saveBoleto() async {
    // try {
    //   var url = 'http://192.168.0.108:3333/boletos/';
    //   await dio.post(url, data: model.toJson());
    //   return;
    // } catch (e) {
    //   print(e);
    // }
    final instance = await SharedPreferences.getInstance();
    final boletos = instance.getStringList("boletos") ?? <String>[];
    boletos.add(model.toJson());
    await instance.setStringList("boletos", boletos);
    return;
  }

  Future<void> cadastrarBoleto() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      return await saveBoleto();
    }
  }
}
