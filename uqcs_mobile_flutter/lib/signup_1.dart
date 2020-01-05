import 'package:flutter/material.dart';
import 'package:uqcs_mobile_flutter/colors.dart';
import 'package:uqcs_mobile_flutter/onboarding_single_button_input_page.dart';

import 'onboarding_text_input_page.dart';
import 'styles.dart';

class MyWidget extends StatefulWidget {
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final emailRegex =
      RegExp(r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)");
  final int _numPages = 4;
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
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    _pageController.previousPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: uqcsBlue,
                    ),
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      OnboardingTextInputPage(
                        promptText: "What is your full name?",
                        hintText: "John Smith",
                        onNextButtonPressed: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        textInputType: TextInputType.text,
                        maxLength: 50,
                        textValidation: RegExp(r".*"),
                      ),
                      OnboardingTextInputPage(
                        promptText: "What is your email address?",
                        hintText: "s4433119@student.uq.edu.au",
                        onNextButtonPressed: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        textInputType: TextInputType.emailAddress,
                        maxLength: 50,
                        textValidation: emailRegex,
                      ),
                      OnboardingSingleChoiceInputPage(
                        promptText: "What is your gender?",
                        buttonChoices: [
                          "Male",
                          "Female",
                          "Other",
                        ],
                        onNextButtonPressed: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                      ),
                      OnboardingTextInputPage(
                        promptText: "What is your student number?",
                        hintText: "44331199",
                        onNextButtonPressed: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        textInputType: TextInputType.number,
                        maxLength: 8,
                        textValidation: RegExp(r"[0-9]{8}"),
                      )
                    ],
                  ),
                ),
//                Expanded(
//                  child: Padding(
//                      padding: EdgeInsets.only(top: 20), child: FirstPage()),
//                ),
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
        color: isActive ? uqcsBlue : Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
