import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stackivy_assesement/constants/colors.dart';
import 'package:stackivy_assesement/presentation/screens/auth/login/login.dart';
import 'package:stackivy_assesement/presentation/screens/onboarding/onboarding.dart';
import '../../constants/pref_key.dart';
import '../../services/shared_prefs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _prefs = SharedPrefs();

  @override
  void initState() {
    super.initState();
    splash();
  }

  void splash() {
    Timer(const Duration(seconds: 2), () {
      _readUserPrefs();
    });
  }

  Future<void> _readUserPrefs() async {
    final userOnboardedPref = await _prefs.getBool(PrefKey.kOnboardingKey);
    bool isUserOnboarded = userOnboardedPref ?? false;

    if (context.mounted) {
      isUserOnboarded
          ? Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            )
          : Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => OnboardingScreen(),
              ),
            );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Container(
          color: kPrimaryColor,
          child: Center(
            child: SvgPicture.asset('images/logo_full.svg'),
          ),
        ),
      ),
    );
  }
}
