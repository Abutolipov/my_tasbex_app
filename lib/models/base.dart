import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DeterminatePage extends StatefulWidget {
  DeterminatePage({Key key}) : super(key: key);
  static const id = "/id_determain";

  @override
  _DeterminatePageState createState() => _DeterminatePageState();
}

class _DeterminatePageState extends State<DeterminatePage> {
  double progressValue = 0;
  int jami = 0;
  bool tr = false;
  double a = 33;
  double max1 = 33;
  String son = "33";

  void method() {
    setState(
      () {
        progressValue++;
        if (progressValue >= max1) {
          progressValue = 0;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: ClipPath(
          clipper: CustomAppBarShape(),
          child: Container(
            color: Colors.green[700],
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 18, top: 80),
                          child: Text(
                            "Tasbih",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          constraints:
                              BoxConstraints.expand(width: 110, height: 60),
                          padding: EdgeInsets.only(left: 25, top: 5),
                          child: Text(
                            "Jami: " + jami.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: jami < 500? 17: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 80, left: 90),
                      child: RaisedButton(
                        padding: EdgeInsets.only(
                            left: 1, right: 1, top: 5, bottom: 5),
                        color: Colors.white,
                        onPressed: () {
                          setState(
                            () {
                              if (max1 == 33) {
                                max1 = 99;
                                son = "99";
                              } else if (max1 == 99) {
                                max1 = 33;
                                son = "33";
                              }
                            },
                          );
                        },
                        child: Text(
                          son,
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                      ),
                    ),
                    IconButton(
                      iconSize: 35,
                      padding: EdgeInsets.only(top: 81, left: 11, right: 15),
                      color: Colors.white12,
                      onPressed: () {
                        setState(
                          () {
                            progressValue = 0;
                          },
                        );
                      },
                      icon: Icon(
                        Icons.refresh,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        preferredSize: Size.fromHeight(kToolbarHeight + 105),
        //preferredSize: Size.fromWidth(kToolbarHeight + 100),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(top: 232),
          children: [
            GestureDetector(
              onTap: () {
                jami++;
                method();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  getFilledTrackStyle(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getFilledTrackStyle() {
    return Row(
      children: [
        Container(
          height: 219,
          width: 219,
          child: SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                minimum: 0,
                maximum: max1,
                showLabels: false,
                showTicks: false,
                startAngle: 270,
                endAngle: 270,
                radiusFactor: 0.9,
                axisLineStyle: AxisLineStyle(
                  color: const Color.fromARGB(250, 10, 160, 1),
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
                pointers: <GaugePointer>[
                  RangePointer(
                    value: progressValue,
                    width: 0.12,
                    //enableAnimation: false,
                    animationDuration: a,
                    color: Colors.white,
                    pointerOffset: 0.1,
                    cornerStyle: CornerStyle.bothCurve,
                    sizeUnit: GaugeSizeUnit.factor,
                  ),
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    positionFactor: 0.5,
                    widget: Text(
                      progressValue.toStringAsFixed(0),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 41.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
class CustomAppBarShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(1, size.height);
    path.arcToPoint(
      Offset(size.width, size.height),
      radius: Radius.elliptical(5, 0.5),
    );
    path.lineTo(size.width, 1);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
