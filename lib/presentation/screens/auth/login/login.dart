import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stackivy_assesement/constants/app_style.dart';
import 'package:stackivy_assesement/constants/colors.dart';
import 'package:stackivy_assesement/presentation/screens/dashboard/dashboard.dart';
import 'package:stackivy_assesement/presentation/widgets/stackivy_button.dart';
import 'package:stackivy_assesement/presentation/widgets/stackivy_text_form_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  // const LoginScreen({Key? key}) : super(key: key);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: false,
              snap: false,
              pinned: true,
              backgroundColor: kPrimaryColor,
              expandedHeight: size.height * 0.2,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'images/small_logo.svg',
                          fit: BoxFit.fill,
                        ),
                        SizedBox(width: size.width * 0.02),
                        Text(
                          'Ardilla',
                          style: StackivyStyle.bold(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03)
                  ],
                ),
                background: SvgPicture.asset(
                  'images/background.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: kPrimaryColor,
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.02,
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: const BoxDecoration(
                        color: kPrimaryLight,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                    ),
                    Container(
                      height: size.height * 0.9,
                      padding: const EdgeInsets.symmetric(horizontal: 36.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: size.height * 0.05),
                          Text(
                            'Welcome !',
                            style: StackivyStyle.bold(
                                color: kBigTextColor, fontSize: 36.0),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Here’s how to Log in to access your account',
                            style: StackivyStyle.regular(
                                color: kGray500, fontSize: 12.0),
                          ),
                          SizedBox(height: size.height * 0.05),
                          StackivyTextFormField(
                            hintText: 'Email Address',
                            controller: _emailController,
                            textInputType: TextInputType.emailAddress,
                            obscureText: false,
                            validator: (text) {},
                            prefixIcon: const Icon(
                              Icons.mail_outline,
                              color: kGray400,
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          StackivyTextFormField(
                            hintText: 'Password',
                            controller: _passwordController,
                            textInputType: TextInputType.text,
                            obscureText: true,
                            validator: (text) {},
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: kGray400,
                            ),
                            suffixIcon: const Icon(
                              Icons.visibility_outlined,
                              color: kGray400,
                            ),
                          ),
                          const SizedBox(height: 12.0),
                          InkWell(
                            onTap: null,
                            child: Text(
                              'Forgot Password?',
                              textAlign: TextAlign.end,
                              style: StackivyStyle.medium(
                                  color: kPrimaryColor, fontSize: 11.0),
                            ),
                          ),
                          SizedBox(height: size.height * 0.045),
                          StackivyButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => DashboardScreen(),
                                ),
                              );
                            },
                            title: 'Log In',
                          ),
                          SizedBox(height: size.height * 0.05),
                          StackivyButton(
                            backgroundColor: Colors.white,
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const FaIcon(
                                  FontAwesomeIcons.signIn,
                                  color: kPrimaryColor,
                                ),
                                SizedBox(width: size.height * 0.02),
                                Text(
                                  'Sign in with SAN ID',
                                  style: StackivyStyle.bold(
                                    color: kPrimaryColor,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(text: 'New User?  '),
                                TextSpan(
                                  text: 'Create Acccount',
                                  style: StackivyStyle.medium(
                                    color: kPrimaryColor,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                              style: StackivyStyle.medium(
                                color: kGray500,
                                fontSize: 12.0,
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
