import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../style/app_style.dart';
import '../../style/colors.dart';

class KycAndCashflow extends StatelessWidget {
  final Size size;

  const KycAndCashflow(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      padding: EdgeInsets.only(
        left: size.width * 0.021,
        top: size.height * 0.01,
        bottom: size.height * 0.01,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '80%',
                style: StackivyStyle.normal(
                  color: kGray500,
                  fontSize: 24.0,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                children: [
                  Text(
                    'Complete KYC',
                    style: StackivyStyle.normal(
                      color: kPrimaryColor,
                      fontSize: 10.0,
                    ),
                  ),
                  const SizedBox(width: 6.0),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: kPrimaryColor,
                    size: 9.0,
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              SizedBox(
                width: size.width * 0.2,
                child: LinearPercentIndicator(
                  padding: const EdgeInsets.only(right: 22.0),
                  percent: 0.7,
                  progressColor: kPrimaryColor,
                  backgroundColor: kGray200,
                ),
              )
            ],
          ),
          SizedBox(width: size.width * 0.03),
          SizedBox(
            height: size.height * 0.1,
            child: VerticalDivider(
              indent: size.width * 0.09,
              color: kGray200,
              width: 1,
              thickness: 1.5,
            ),
          ),
          SizedBox(width: size.width * 0.04),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.arrow_drop_up,
                    color: kGreen500,
                  ),
                  Text(
                    '100%',
                    style: StackivyStyle.normal(
                      color: kGreen500,
                      fontSize: 10.0,
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Text(
                    'Cashflow',
                    style: StackivyStyle.normal(
                      color: kBigTextColor,
                      fontSize: 10.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100.0,
                width: size.width * 0.5,
                child: AspectRatio(
                  aspectRatio: 1.1,
                  child: LineChart(
                    _lineChartData(),
                  ),
                ),
              ),
              Row(
                children: [
                  cashflow(
                    Colors.white,
                    const Color(0xFFE8356D),
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    'Inflow',
                    style: StackivyStyle.normal(
                      color: kPrimaryColor,
                      fontSize: 10.0,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  cashflow(
                    Colors.transparent,
                    kPrimaryColor,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    'Outflow',
                    style: StackivyStyle.normal(
                      color: kPrimaryColor,
                      fontSize: 10.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget cashflow(Color iconColor, Color parentColor) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: parentColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.check,
        color: iconColor,
        size: 12,
      ),
    );
  }

  LineChartData _lineChartData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.red,
            strokeWidth: 0.41,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.transparent,
            strokeWidth: 0.41,
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
            getTitlesWidget: (size, e) {
              return Container();
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 8,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 0),
            FlSpot(0.6, 2.9),
            FlSpot(1.7, 0.3),
            FlSpot(3.5, 4.2),
            FlSpot(4.3, 0.5),
            FlSpot(5.5, 1.4),
            FlSpot(6.0, 1.2),
            FlSpot(8.0, 6.0),
            FlSpot(9.0, 0.8),
            FlSpot(11.0, 4.5),
          ],
          isCurved: true,
          // gradient: CredioColors.lineGradient,
          barWidth: 2.5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            // gradient: CredioColors.chartGradient,
          ),
        ),
      ],
    );
  }
}
