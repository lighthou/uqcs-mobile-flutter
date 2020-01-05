import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uqcs_mobile_flutter/signup_1.dart';

import 'styles.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFF7B51D3),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: onboardingBoxDecoration(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 500.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(20.0), child: MyWidget()),
//                      Padding(
//                        padding: EdgeInsets.all(40.0),
//                        child: Column(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: <Widget>[],
//                        ),
//                      ),
//                      Padding(
//                        padding: EdgeInsets.all(40.0),
//                        child: Column(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: <Widget>[],
//                        ),
//                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Decoration onboardingBoxDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.1, 0.4, 0.7, 0.9],
        colors: [
          Color(0xFF3594DD),
          Color(0xFF4563DB),
          Color(0xFF5036D5),
          Color(0xFF5B16D0),
        ],
      ),
    );
  }
}
