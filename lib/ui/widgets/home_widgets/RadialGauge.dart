import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RadialGauge extends StatelessWidget {
  String temperatureVale;

  RadialGauge(this.temperatureVale);

  @override
  Widget build(BuildContext context) {
    temperatureVale = (temperatureVale == null) ? "-30" : temperatureVale;
    //print(temperatureVale);
    return Container(
        margin: EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 13),
        height: 125,
        width: 125,
        //MediaQuery.of(context).size.height*0.2
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return SfRadialGauge(axes: <RadialAxis>[
            RadialAxis(
                ticksPosition: ElementsPosition.inside,
                labelsPosition: ElementsPosition.inside,
                // minorTicksPerInterval: 10,
                axisLineStyle: AxisLineStyle(
                  thickness: 0.1,
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
                minimum: -30,
                maximum: 40,
                interval: 10,
                pointers: <GaugePointer>[
                  RangePointer(
                    //enableAnimation: true,
                    value: double.parse(temperatureVale),
                    width: 0.1,
                    sizeUnit: GaugeSizeUnit.factor,
                    gradient: const SweepGradient(
                      colors: <Color>[Color(0xFF00BFFF), Color(0xFF753A88)],
                    ),
                  ),
                  NeedlePointer(value:  double.parse(temperatureVale),
                      lengthUnit: GaugeSizeUnit.factor,
                      needleLength: 0.75, needleColor: Colors.blue,
                      needleStartWidth: 1, needleEndWidth: 6)
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      widget: Text(
                        '$temperatureVale',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                      positionFactor: 0.8,
                      angle: 90)
                ]),
          ]);
        }));
  }
}
