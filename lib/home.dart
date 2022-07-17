import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isExtended = true;
  int? indexNo;
  List dates = ['16', '17', '18', '19', '20', '21'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple.shade100,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                color: Colors.white.withOpacity(0.9),
                height: 50,
              ),
              SafeArea(
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 0, 10, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      child: Text(
                                        'U',
                                        style: TextStyle(
                                            color: Colors.purple.shade900,
                                            fontSize: 20),
                                      ),
                                      radius: 28,
                                      backgroundColor: Colors.purple.shade100
                                          .withOpacity(0.4),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: Text(
                                        'Hi user!',
                                        style: TextStyle(fontSize: 25),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.menu,
                                    size: 30,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Container(
                        height: 800,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 20, 12, 0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 10, 0),
                                          child: TextButton(
                                            onPressed: () {},
                                            child: Row(
                                              children: [
                                                Text(
                                                  'CGM #1',
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      color: Colors
                                                          .purple.shade900),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          5, 0, 0, 0),
                                                  child: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color:
                                                        Colors.purple.shade900,
                                                    size: 35,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Row(children: const [
                                      Text(
                                        'TRENDS',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.white),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Icon(
                                          Icons.arrow_forward_rounded,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ]),
                                    style: OutlinedButton.styleFrom(
                                      primary: Colors.purple.shade900,
                                      backgroundColor: Colors.purple.shade900,
                                      side: const BorderSide(
                                          width: 0.8, color: Colors.indigo),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 40, 10, 0),
                                child: SizedBox(
                                  height: 100,
                                  width: 800,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: dates.length,
                                            itemBuilder: (BuildContext context,
                                                    int i) =>
                                                // AnimatedButton(dateNo: '16'),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 0, 10, 0),
                                                  child: AnimatedSwitcher(
                                                    duration: const Duration(
                                                        seconds: 1),
                                                    transitionBuilder: (Widget
                                                                child,
                                                            Animation<double>
                                                                animation) =>
                                                        FadeTransition(
                                                      opacity: animation,
                                                      child: SizeTransition(
                                                        child: child,
                                                        sizeFactor: animation,
                                                        axis: Axis.horizontal,
                                                      ),
                                                    ),
                                                    child: indexNo != i
                                                        ? InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                if (indexNo !=
                                                                    i) {
                                                                  indexNo = i;
                                                                } else {
                                                                  indexNo =
                                                                      null;
                                                                }
                                                              });
                                                            },
                                                            child: CircleAvatar(
                                                              radius: 25,
                                                              backgroundColor:
                                                                  Colors.purple
                                                                      .shade900
                                                                      .withOpacity(
                                                                          0.3),
                                                              child:
                                                                  CircleAvatar(
                                                                radius: 23,
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                child: Text(
                                                                  dates[i],
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .purple
                                                                          .shade900
                                                                          .withOpacity(
                                                                              0.6)),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        : SizedBox(
                                                            height: 50,
                                                            width: 80,
                                                            child:
                                                                OutlinedButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  if (indexNo !=
                                                                      i) {
                                                                    indexNo = i;
                                                                  } else {
                                                                    indexNo =
                                                                        null;
                                                                  }
                                                                });
                                                              },
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    dates[i],
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .purple
                                                                            .shade900),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            3.0),
                                                                    child: Text(
                                                                      "Tue",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .purple
                                                                              .shade900),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              style:
                                                                  OutlinedButton
                                                                      .styleFrom(
                                                                primary: Colors
                                                                    .white,
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                side: BorderSide(
                                                                    width: 2,
                                                                    color: Colors
                                                                        .purple
                                                                        .shade900),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30)),
                                                              ),
                                                            ),
                                                          ),
                                                  ),
                                                )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 0, 10, 0),
                                child: Container(
                                  height: 450,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.purple.shade900
                                              .withOpacity(0.1),
                                          offset: const Offset(0, 1),
                                          blurRadius: 3.0,
                                          spreadRadius: 1.0)
                                    ],
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(top: 60.0),
                                    child: LineChartWidget(),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({Key? key}) : super(key: key);

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.02,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ),
        /*SizedBox(
          width: 60,
          height: 34,
          child: TextButton(
            onPressed: () {
              setState(() {
                showAvg = !showAvg;
              });
            },
            child: Text(
              'avg',
              style: TextStyle(
                  fontSize: 12,
                  color:
                      showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
            ),
          ),
        ),*/
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('12 Am', style: style);
        break;
      case 1:
        text = const Text('1 AM', style: style);
        break;
      case 2:
        text = const Text('2 AM', style: style);
        break;
      case 3:
        text = const Text('3 AM', style: style);
        break;
      case 4:
        text = const Text('4 AM', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '40';
        break;
      case 2:
        text = '80';
        break;
      case 4:
        text = '140';
        break;
      case 6:
        text = '200';
        break;
      case 8:
        text = '300';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.grey,
            strokeWidth: 0.3,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 0)),
      minX: 0,
      maxX: 4,
      minY: 0,
      maxY: 8,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 0.5),
            FlSpot(1.6, 1.2),
            FlSpot(1.68, 2.02),
            FlSpot(1.99, 2.35),
            FlSpot(2.08, 3.02),
            FlSpot(2.43, 3.12),
            FlSpot(2.78, 3.56),
            FlSpot(2.9, 5),
            FlSpot(4, 3.1),
            /* FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
            FlSpot(12, 3),*/
            /* FlSpot(14.6, 2),
            FlSpot(16.9, 5),
            FlSpot(17.8, 3.1),
            FlSpot(18, 4),
            FlSpot(19.5, 3),
            FlSpot(20.6, 2),
            FlSpot(24.9, 5),8*/
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }
}
