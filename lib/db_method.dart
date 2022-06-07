import 'dart:async';
import 'dart:convert';
import 'db_class.dart';
import 'package:flutter/services.dart' show rootBundle;

class HttpService {
  Future<List<StoreList>> getProducts() async {
    var data = await rootBundle.loadString('assets/generatedJsonFile.json');
    final jsonValue = json.decode(data);
    List<dynamic> value = jsonValue;

    List<StoreList> items = value
        .map(
          (item) => StoreList.fromJson(item),
        )
        .toList();

    return items; // json data from server decoded and returned as a list
  }
}
