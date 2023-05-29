import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:stackivy_assesement/style/app_style.dart';
import 'package:stackivy_assesement/style/colors.dart';
import 'package:stackivy_assesement/models/podos/onboarding_contents.dart';
import 'package:stackivy_assesement/presentation/screens/auth/login/login.dart';
import 'package:stackivy_assesement/presentation/screens/auth/registration/getting_started.dart';

import '../../../constants/pref_key.dart';
import '../../../services/shared_prefs.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();

  int _currentPage = 0;

  SharedPrefs prefs = SharedPrefs();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Visibility(
                visible: _currentPage + 1 == contents.length ? false : true,
                child: InkWell(
                  onTap: () {
                    _pageController.animateToPage(
                      contents.length - 1,
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text(
                    'Skip',
                    textAlign: TextAlign.end,
                    style: StackivyStyle.bold(
                      color: kPrimaryColor,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              SizedBox(
                height: size.height * 0.65,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      _currentPage = value;
                    });
                  },
                  controller: _pageController,
                  itemCount: contents.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image.asset(contents[index].image),
                        SizedBox(height: size.height * 0.01),
                        Text(
                          contents[index].title,
                          textAlign: TextAlign.center,
                          style: StackivyStyle.bold(
                            color: kBigTextColor,
                            fontSize: 36.0,
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Text(
                          contents[index].desc,
                          textAlign: TextAlign.center,
                          style: StackivyStyle.regular(
                            color: kGray500,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: size.height * 0.09),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                      contents.length,
                      (index) => buildDot(index),
                    ),
                  ),
                  InkWell(
                    onTap: _currentPage + 1 == contents.length
                        ? () {
                            prefs.setBool(PrefKey.kOnboardingKey, true);
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => GettingStartedScreen(),
                              ),
                            );
                            Curves.easeIn;
                          }
                        : () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 360),
                              curve: Curves.easeIn,
                            );
                          },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        pageProgress(size, _currentPage),
                        Container(
                          padding: EdgeInsets.all(size.width * 0.03),
                          decoration: const BoxDecoration(
                            color: kPrimaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_forward_sharp,
                            color: Colors.white,
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
      ),
    );
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 200,
      ),
      decoration: BoxDecoration(
        color: _currentPage == index ? kPrimaryColor : kPrimaryLight,
        borderRadius: BorderRadius.circular(50.0),
      ),
      margin: const EdgeInsets.only(right: 2),
      height: 7,
      width: _currentPage == index ? 30 : 7,
    );
  }

  Widget pageProgress(Size size, int index) {
    return SizedBox(
      height: size.height * 0.09,
      width: size.width * 0.2,
      child: CircularProgressIndicator(
        color: kPrimaryColor,
        backgroundColor: kPrimaryLight,
        value: index == 0
            ? 0.3
            : index == 1
                ? 0.6
                : 1.0,
      ),
    );
  }
}
