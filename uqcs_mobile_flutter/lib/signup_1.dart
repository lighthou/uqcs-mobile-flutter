import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uqcs_mobile_flutter/colors.dart';

import 'package:uqcs_mobile_flutter/first_screen.dart';

import 'styles.dart';

class MyWidget extends StatefulWidget {
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.arrow_back_ios,
                  color: uqcsBlue,
                ),
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.only(top: 20), child: FirstPage()),
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

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : uqcsBlue,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'What\'s your full name?',
          style: kTitleStyle,
        ),
        SizedBox(
          height: 20.0,
        ),
        TextField(
          autofocus: true,
          style: kTextFieldInputStyle,
          decoration: InputDecoration.collapsed(
            hintStyle: kTextFieldInputStyle.copyWith(color: disabledColor),
            hintText: 'John Smith',
          ),
        ),
        Expanded(child: SizedBox()),
        ButtonTheme(
          minWidth: double.infinity,
          child: RaisedButton(
            color: uqcsBlue,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text('Next'),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
