import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Nutrition extends StatefulWidget {
  const Nutrition({Key? key}) : super(key: key);

  @override
  State<Nutrition> createState() => _NutritionState();
}

class _NutritionState extends State<Nutrition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.withOpacity(0.2),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Center(child: TestContainer()), TestContainer1()],
        ));
  }
}

class TestContainer extends Container {
  final double widthData;
  final double heightData;
  final Color colorData;
  TestContainer(
      {Key? key,
      this.colorData = Colors.transparent,
      this.widthData = 400,
      this.heightData = 300})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthData,
      height: heightData,
      color: colorData,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Container(
                  width: 380,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(10.0),
                    /*   boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 1),
                          blurRadius: 3.0,
                          spreadRadius: 1.0)
                    ],*/
                  ),
                ),
              ),
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  double space = 100;

  @override
  Path getClip(Size size) {
    final path = Path();
    final halfWidth = size.width / 2;
    final halfSpace = space / 2;
    final curve = space / 6;
    final height = halfSpace / 1.4;
    path.lineTo(halfWidth - halfSpace, 0);
    path.cubicTo(halfWidth - halfSpace, 0, halfWidth - halfSpace + curve,
        height, halfWidth, height);

    path.cubicTo(halfWidth, height, halfWidth + halfSpace - curve, height,
        halfWidth + halfSpace, 0);

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TestContainer1 extends Container {
  final double widthData;
  final double heightData;
  final Color colorData;
  TestContainer1(
      {Key? key,
      this.colorData = Colors.transparent,
      this.widthData = 400,
      this.heightData = 300})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthData,
      height: heightData,
      color: colorData,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: ClipPath(
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(10.0),
                      /*boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 1),
                            blurRadius: 3.0,
                            spreadRadius: 1.0)
                      ],*/
                    ),
                  ),
                  clipper: CustomClipPath(),
                ), /*Container(
                  width: 380,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 1),
                          blurRadius: 3.0,
                          spreadRadius: 1.0)
                    ],
                  ),
                ),*/
              ),
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
