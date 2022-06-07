import 'dart:convert';
import 'package:fake_store/productScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'db_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Box? box;
  bool dataLoaded = false;
  Future openHiveBox() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    box = await Hive.openBox('productData');
    return;
  }

  Future<List<StoreList>> getData() async {
    await openHiveBox();
    try {
      var data = await rootBundle.loadString('assets/generatedJsonFile.json');
      var value = json.decode(data);

      await createHiveData(value);
    } catch (e) {
      print('no data');
    }
    var myMap = box!.toMap().values.toList();

    List<dynamic> value = myMap;

    List<StoreList> items = value
        .map(
          (item) => StoreList.fromJson(item),
        )
        .toList();

    return items;
  }

  Future createHiveData(data) async {
    await box!.clear();
    for (var d in data) {
      box!.add(d);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fake Store'),
      ),
      body: SafeArea(
          child: dataLoaded == true
              ? FutureBuilder(
                  future: getData(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<StoreList>> snapshot) {
                    if (snapshot.hasData) {
                      List<StoreList>? products = snapshot.data;
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Data loaded from database'),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProductPage(
                                              products: products!)));
                                },
                                child: const Text('Navigate to product page'))
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('no data'),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })
              : Center(
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          dataLoaded = true;
                        });
                      },
                      child: const Text('Load data from databse')))),
    );
  }
}
