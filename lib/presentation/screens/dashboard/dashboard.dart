import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:stackivy_assesement/presentation/screens/auth/login/login.dart';
import 'package:stackivy_assesement/presentation/widgets/coming_soon.dart';
import 'package:stackivy_assesement/presentation/widgets/explore.dart';
import 'package:stackivy_assesement/presentation/widgets/investments.dart';
import 'package:stackivy_assesement/presentation/widgets/kyc_and_cashflow.dart';
import 'package:stackivy_assesement/presentation/widgets/quick_links.dart';
import 'package:stackivy_assesement/presentation/widgets/rank.dart';
import 'package:stackivy_assesement/presentation/widgets/wallet.dart';
import 'package:stackivy_assesement/style/app_style.dart';
import 'package:stackivy_assesement/style/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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

  int _currentPage = 0;

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
                        size,
                        index,
                      );
                    },
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
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
        padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //wallet
            SizedBox(
              height: size.height * 0.31,
              child: PageView.builder(
                pageSnapping: false,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                itemCount: 3,
                itemBuilder: (context, index) => Column(
                  children: [
                    WalletCard(size, index),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        3,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 320),
                          margin: const EdgeInsets.only(right: 5.0),
                          height: size.height * 0.005,
                          width: size.height * 0.07,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? kPrimaryColor
                                : StackivyColors.lightGray,
                            borderRadius: BorderRadius.circular(90.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            //Quick Links
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'Quick Links',
                style: StackivyStyle.normal(
                  color: kBigTextColor,
                  fontSize: 14.0,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  4,
                  (index) => QuickLinks(size, index),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            //ccashflow
            KycAndCashflow(size),
            SizedBox(height: size.height * 0.02),
            //Investments
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: List.generate(
                  2,
                  (index) => Card(
                    elevation: index == 0 ? 0.0 : 1.0,
                    margin: const EdgeInsets.only(left: 14.0),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Icon(
                        index == 0
                            ? Icons.arrow_back_ios
                            : Icons.arrow_forward_ios,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.016),
            SizedBox(
              height: size.height * 0.29,
              child: PageView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => InvestmentCards(
                  size,
                  index,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.04),
            //rank
            SizedBox(
              height: size.height * 0.35,
              child: PageView.builder(
                pageSnapping: false,
                itemCount: 4,
                itemBuilder: (context, index) => RanksCard(
                  size,
                  index,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    'Explore',
                    style: StackivyStyle.medium(
                      color: kBigTextColor,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                SizedBox(
                  height: size.height * 0.25,
                  child: PageView.builder(
                    pageSnapping: false,
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) => ExploreCard(size, index),
                  ),
                )
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
            icon: SvgPicture.asset('images/home.svg'),
          ),
          BottomNavigationBarItem(
            label: 'Save',
            icon: SvgPicture.asset('images/save.svg'),
          ),
          BottomNavigationBarItem(
            label: 'Explore',
            icon: SvgPicture.asset('images/explore.svg'),
          ),
          BottomNavigationBarItem(
            label: 'Learn',
            icon: SvgPicture.asset('images/learn.svg'),
          ),
          BottomNavigationBarItem(
            label: 'Dilla',
            icon: SvgPicture.asset('images/dilla.svg'),
          ),
        ],
      ),
    );
  }

  Widget drawerItem(String title, String leadingData, Size size, int index) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SvgPicture.asset(
        leadingData,
        // color: Colors.white,
      ),
      title: Expanded(
        child: Text(
          title,
          style: StackivyStyle.medium(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
      trailing: index == 3 || index == 4
          ? const SizedBox(
              child: ComingSoon(7.0),
            )
          : const SizedBox.shrink(),
    );
  }

  Widget userAvatar(Size size, Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Image.asset('images/user_avatar.png'),
    );
  }
}
