import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uqcs_mobile_flutter/styles.dart';

import 'colors.dart';

class OnboardingTextInputPage extends StatefulWidget {
  final String initalText;
  final String promptText;
  final String hintText;
  final TextInputType textInputType;
  final Function onNextButtonPressed;
  final int maxLength;
  final RegExp textValidation;
  final Function completionCallback;

  OnboardingTextInputPage(
      {@required this.promptText,
      @required this.hintText,
      @required this.onNextButtonPressed,
      @required this.textInputType,
      @required this.maxLength,
      this.textValidation,
      @required this.completionCallback,
      this.initalText});

  @override
  _OnboardingTextInputPageState createState() =>
      _OnboardingTextInputPageState();
}

class _OnboardingTextInputPageState extends State<OnboardingTextInputPage> {
  String currentInput;
  bool _nextButtonEnabled = false;
  String _currentText;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => FocusScope.of(context).requestFocus(_focusNode));
    _nextButtonEnabled = widget.initalText != null;
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
        TextFormField(
          initialValue: widget.initalText,
          keyboardType: widget.textInputType,
          onChanged: (text) {
            _currentText = text;
            setState(() {
              _nextButtonEnabled =
                  widget.textValidation.hasMatch(_currentText) ? true : false;
            });
          },
          focusNode: _focusNode,
          maxLength: widget.maxLength,
          style: kTextFieldInputStyle,
          decoration: InputDecoration(
            border: InputBorder.none,
            counterText: '',
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
                        widget.completionCallback(_currentText == null
                            ? widget.initalText
                            : _currentText);
                        widget.onNextButtonPressed();
                      }),
          ),
        ),
      ],
    );
  }
}
