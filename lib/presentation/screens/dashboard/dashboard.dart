import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:stackivy_assesement/constants/app_style.dart';
import 'package:stackivy_assesement/constants/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardScreen extends StatelessWidget {
  List<String> title = [
    'Profile',
    'Portfolio',
    'Payment',
    'Investment',
    'Insurance',
    'Budgeting',
  ];

  List<String> iconData = [
    'images/profile.svg',
    'images/portfolio.svg',
    'images/payment.svg',
    'images/investment.svg',
    'images/insurance.svg',
    'images/budgeting.svg',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        leadingWidth: 80.0,
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 4.0, 0.0, 0.0),
              child: userAvatar(
                size,
                () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            );
          },
        ),
        // titleSpacing: 20.0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Good Morning.',
                  style: StackivyStyle.normal(
                    color: kGray400,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4.0),
            Text(
              'Cadet <Annie/>',
              style: StackivyStyle.normal(
                color: kBigTextColor,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 45.0, top: 28.0),
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 3.0),
                  color: Colors.white,
                  child: Icon(
                    Icons.notifications_outlined,
                    color: kGray400,
                    size: size.height * 0.04,
                  ),
                ),
                Container(
                  height: 10.0,
                  width: 10.0,
                  margin: const EdgeInsets.only(right: 3.0, top: 7.0),
                  decoration: const BoxDecoration(
                    color: kGray400,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          width: size.width * 0.6,
          backgroundColor: kPrimaryColor,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.height * 0.02,
              horizontal: size.width * 0.04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                userAvatar(
                  size,
                  null,
                ),
                Text(
                  'Anita Ojieh',
                  style: StackivyStyle.bold(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: size.height * 0.07),
                SizedBox(
                  height: size.height * 0.7,
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return drawerItem(
                        title[index],
                        iconData[index],
                      );
                    },
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      SvgPicture.asset('images/logout.svg'),
                      SizedBox(width: size.width * 0.03),
                      Text(
                        'Logout',
                        style: StackivyStyle.medium(
                          color: Colors.white,
                          fontSize: 12.0,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.04,
                vertical: size.height * 0.05,
              ),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(22.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'SAN',
                        style: StackivyStyle.normal(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(width: size.width * 0.04),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: StackivyColors.harmony,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text(
                          '+10.00%',
                          style: StackivyStyle.normal(
                            color: Colors.white,
                            fontSize: 10.0,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'NGN 100,000.00',
                        style: StackivyStyle.normal(
                          color: Colors.white,
                          fontSize: 22.0,
                        ),
                      ),
                      const FaIcon(
                        FontAwesomeIcons.eye,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.027),
                  Text(
                    '**********',
                    style: StackivyStyle.normal(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Generate Account Number',
                        style: StackivyStyle.normal(
                          color: Colors.white,
                          fontSize: 11.0,
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_forward_sharp,
                          size: 16.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: size.height * 0.04),
            Text(
              'Quick Links',
              style: StackivyStyle.normal(
                color: kBigTextColor,
                fontSize: 14.0,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                4,
                (index) => quickLinks(size, index),
              ),
            ),
            SizedBox(height: size.height * 0.04),
            Container(
              padding: const EdgeInsets.only(left: 24.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
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
                      SizedBox(
                        width: 100,
                        child: LinearPercentIndicator(
                          padding: const EdgeInsets.only(right: 22.0),
                          percent: 0.7,
                          progressColor: kPrimaryColor,
                          backgroundColor: kGray200,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: size.width * 0.018),
                  const SizedBox(
                    height: 50.0,
                    child: VerticalDivider(
                      color: kGray200,
                      // width: 1,
                      thickness: 1.5,
                    ),
                  ),
                  SizedBox(height: size.width * 0.021),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 24.0),
                        child: Row(
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
                      ),
                      SizedBox(
                        height: 100.0,
                        width: 200,
                        child: AspectRatio(
                          aspectRatio: 1.1,
                          child: LineChart(
                            _lineChartData(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 24.0),
                        child: Row(
                          children: [
                            cashflow(
                              Colors.white,
                              Color(0xFFE8356D),
                            ),
                            SizedBox(width: 4.0),
                            Text(
                              'Inflow',
                              style: StackivyStyle.normal(
                                color: kPrimaryColor,
                                fontSize: 10.0,
                              ),
                            ),
                            SizedBox(width: 8.0),
                            cashflow(
                              Colors.transparent,
                              kPrimaryColor,
                            ),
                            SizedBox(width: 4.0),
                            Text(
                              'Outflow',
                              style: StackivyStyle.normal(
                                color: kPrimaryColor,
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              color: Colors.white,
              elevation: 0.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: size.height * 0.03, bottom: size.height * 0.013),
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [
                          0.0,
                          1.0,
                        ],
                        colors: [
                          const Color(0xFF8807F7).withOpacity(0.3),
                          const Color(0xFFD9D9D9).withOpacity(0.0),
                        ],
                      ),
                    ),
                    child: SvgPicture.asset('images/investing.svg'),
                  ),
                  Text(
                    'Unprecedented access to\ninvestment opportunities',
                    textAlign: TextAlign.center,
                    style: StackivyStyle.normal(
                      color: kBigTextColor,
                      fontSize: 15.0,
                    ),
                  ),
                  SizedBox(height: size.height * 0.014),
                  Text(
                    '20% Monthly ROI',
                    textAlign: TextAlign.center,
                    style: StackivyStyle.normal(
                      color: kGray400,
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(height: size.height * 0.012),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Start Investing',
                        style: StackivyStyle.normal(
                          color: kPrimaryColor,
                          fontSize: 10.0,
                        ),
                      ),
                      SizedBox(width: size.width * 0.006),
                      Icon(
                        Icons.arrow_forward,
                        color: kPrimaryColor,
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.03),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Rank',
                  textAlign: TextAlign.start,
                  style: StackivyStyle.normal(
                    color: kBigTextColor,
                    fontSize: 16.0,
                  ),
                ),
                Card(
                  elevation: 0.5,
                  color: Color(0xFFFEF6F8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cadet',
                            style: StackivyStyle.bold(
                              color: kSaveDecColor,
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            'Move up your Rank by completing\ntransactions',
                            style: StackivyStyle.regular(
                              color: kBigTextColor,
                              fontSize: 10.0,
                            ),
                          )
                        ],
                      ),
                      SvgPicture.asset(
                        'images/cadet.svg',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Explore',
                  style: StackivyStyle.medium(
                    color: kBigTextColor,
                    fontSize: 16.0,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.06,
                    vertical: size.height * 0.06,
                  ),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10.0),
                    // image: DecorationImage(
                    //   opacity: 0.0,
                    //   fit: BoxFit.cover,
                    //   image: AssetImage('images/explore_background.jpg'),
                    // ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Text(
                            'My Family and I',
                            style: StackivyStyle.medium(
                              color: StackivyColors.valeViolet,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: size.height * 0.008),
                          Text(
                            'A family that stays together stays forever',
                            style: StackivyStyle.medium(
                              color: StackivyColors.valeViolet,
                              fontSize: 9.0,
                            ),
                          ),
                          SizedBox(height: size.height * 0.016),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60.0),
                              border: Border.all(
                                color: Colors.white,
                              ),
                            ),
                            child: Text(
                              'Coming Soon',
                              style: StackivyStyle.medium(
                                color: Colors.white,
                                fontSize: 9.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: size.width * 0.06),
                      SizedBox(
                        height: size.height * 0.09,
                        child: const VerticalDivider(
                          color: Colors.white,
                          thickness: 2.0,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: kGray500,
        selectedItemColor: kPrimaryColor,
        unselectedLabelStyle: StackivyStyle.normal(
          color: kGray500,
          fontSize: 12.0,
        ),
        selectedLabelStyle: StackivyStyle.normal(
          color: kPrimaryColor,
          fontSize: 12.0,
        ),
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Save',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Explore',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Learn',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Dilla',
            icon: Icon(Icons.home),
          ),
        ],
      ),
    );
  }

  Widget drawerItem(String title, String leadingData) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SvgPicture.asset(
        leadingData,
        // color: Colors.white,
      ),
      title: Text(
        title,
        style: StackivyStyle.medium(
          color: Colors.white,
          fontSize: 12.0,
        ),
      ),
    );
  }

  Widget cashflow(Color iconColor, Color parentColor) {
    return Container(
      padding: EdgeInsets.all(2.0),
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
            showTitles: true,
            interval: 1,
            getTitlesWidget: (size, e) {
              return Container();
            },
            reservedSize: 42,
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

  Widget userAvatar(Size size, Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Image.asset('images/user_avatar.png'),
    );
  }

  Widget quickLinks(Size size, int index) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: size.height * 0.02,
          ),
          decoration: BoxDecoration(
              color: index == 0
                  ? kPrimaryColor
                  : index == 1
                      ? const Color(0xFFE8356D)
                      : index == 2
                          ? const Color(0xFF14B8A6)
                          : index == 3
                              ? const Color(0xFFFACC15)
                              : const Color(0xFFD09CFC),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0.5, 9).scale(0.5, 0.6),
                  color: index == 0
                      ? Color(0xFFD09CFC)
                      : index == 1
                          ? Color(0xFFFAD1DE)
                          : index == 2
                              ? Color(0xFFD1FAF5)
                              : index == 3
                                  ? Color(0xFFFEF4CD)
                                  : Color(0xFFD09CFC),
                ),
              ]),
          child: SvgPicture.asset(
            'images/star.svg',
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          index == 0
              ? 'SAN'
              : index == 1
                  ? 'Save'
                  : index == 2
                      ? 'Learn'
                      : index == 3
                          ? 'Payment'
                          : '',
          style: StackivyStyle.normal(
            color: kBigTextColor,
            fontSize: 10.0,
          ),
        ),
      ],
    );
  }
}
