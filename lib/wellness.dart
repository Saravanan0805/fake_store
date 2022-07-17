import 'package:flutter/material.dart';

class WellNess extends StatefulWidget {
  const WellNess({Key? key}) : super(key: key);

  @override
  State<WellNess> createState() => _WellNessState();
}

class _WellNessState extends State<WellNess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
      ),
    );
  }
}
