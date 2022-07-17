import 'package:flutter/material.dart';
import 'home.dart';
import 'wellness.dart';
import 'nutrition.dart';
import 'log.dart';
import 'progress.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const Nutrition(),
    const HomeView(),
    const Progress(),
    const LogView(),
    const WellNess()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // print('hi');
        },
        tooltip: "Log",
        backgroundColor: Colors.white,
        elevation: 0,
        child: Container(
          child: InkWell(
            onTap: () {
              onTabTapped(2);
              print('hi');
            },
            child: const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: Icon(Icons.add_box_outlined,
                    size: 35, color: Colors.black)),
          ),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(
              Radius.circular(100),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.shade900.withOpacity(0.3),
                spreadRadius: 7,
                blurRadius: 7,
                offset: const Offset(0, 1),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black54,
          unselectedFontSize: 15,
          selectedFontSize: 15,
          selectedIconTheme: null,
          iconSize: 30,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.rice_bowl),
              label: "Nutrition",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: SizedBox(
                    height: 20,
                  )),
              label: "Log",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_run_rounded),
              label: "Save",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_rounded),
              label: "Profile",
            ),
          ]),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
