import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yobills/shared/models/boleto_model.dart';

import 'package:dio/dio.dart';

class BoletoListController {
  final boletosNotifier = ValueNotifier<List<BoletoModel>>(<BoletoModel>[]);

  List<BoletoModel> get boletos => boletosNotifier.value;
  set boletos(List<BoletoModel> value) => boletosNotifier.value = value;

  Dio dio = Dio();

  BoletoListController() {
    getBoletos();
  }

  Future<void> getBoletos() async {
    // try {
    //   final url = 'http://192.168.0.108:3333/boletos/';
    //   final response = await dio.get(url);
    //   final data = response.data as List<dynamic>;

    //   //var tese = json.decode(data[0]).cast<BoletoModel>();
    //   boletos = data.map((e) => BoletoModel.fromJson(e)).toList();
    //   return;
    // } catch (e) {
    //   print(e);
    //   boletos = <BoletoModel>[];
    // }
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList("boletos") ?? <String>[];
      boletos = response.map((e) => BoletoModel.fromJson(e)).toList();
    } catch (e) {
      boletos = <BoletoModel>[];
    }
  }
}
