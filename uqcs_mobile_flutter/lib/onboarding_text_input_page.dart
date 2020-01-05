import 'package:flutter/material.dart';
import 'package:uqcs_mobile_flutter/styles.dart';

import 'colors.dart';

class OnboardingTextInputPage extends StatefulWidget {
  final String promptText;
  final String hintText;
  final TextInputType textInputType;
  final Function onNextButtonPressed;
  final int maxLength;

  OnboardingTextInputPage(
      {@required this.promptText,
      @required this.hintText,
      @required this.onNextButtonPressed,
      @required this.textInputType,
      @required this.maxLength});

  @override
  _OnboardingTextInputPageState createState() =>
      _OnboardingTextInputPageState();
}

class _OnboardingTextInputPageState extends State<OnboardingTextInputPage> {
  String currentInput;
  bool _nextButtonEnabled = false;
  final textFieldController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => FocusScope.of(context).requestFocus(_focusNode));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.promptText,
          style: kTitleStyle,
        ),
        SizedBox(
          height: 20.0,
        ),
        TextField(
          keyboardType: widget.textInputType,
          onChanged: (text) {
            setState(() {
              _nextButtonEnabled = text.isEmpty ? false : true;
            });
          },
          controller: textFieldController,
          focusNode: _focusNode,
          maxLength: widget.maxLength,
          style: kTextFieldInputStyle,
          decoration: InputDecoration.collapsed(
            hintStyle: kTextFieldInputStyle.copyWith(color: disabledColor),
            hintText: widget.hintText,
          ),
        ),
        Expanded(child: SizedBox()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: ButtonTheme(
            minWidth: double.infinity,
            child: RaisedButton(
                disabledColor: disabledColor,
                color: uqcsBlue,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text('Next'),
                ),
                onPressed: !_nextButtonEnabled
                    ? null
                    : () {
                        widget.onNextButtonPressed();
                      }),
          ),
        ),
      ],
    );
  }
}
