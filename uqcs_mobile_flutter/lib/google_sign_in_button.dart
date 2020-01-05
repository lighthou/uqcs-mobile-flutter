import 'package:flutter/material.dart';
import 'package:uqcs_mobile_flutter/sign_in.dart';

import 'first_screen.dart';

class ImageButton extends StatelessWidget {
  final Function onPressed;
  final Image image;
  final String text;
  List<Widget> widgetList = [];

  ImageButton({this.image, this.text, this.onPressed}) : super() {
    if (image != null) {
      widgetList.add(image);
    }
    widgetList.add(Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        this.text,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Theme(
          data: Theme.of(context).copyWith(
              buttonTheme: ButtonTheme.of(context).copyWith(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap)),
          child: OutlineButton(
            splashColor: Colors.grey,
            color: Colors.white,
            onPressed: () {
              this.onPressed();
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            highlightElevation: 0,
            borderSide: BorderSide(color: Colors.black),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widgetList),
            ),
          ),
        ),
      ),
    );
  }
}
