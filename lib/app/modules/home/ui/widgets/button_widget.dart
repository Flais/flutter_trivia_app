import 'package:flutter/material.dart';

import 'back_ground_circle.dart';

class StandardButton extends StatelessWidget {
  final String _text;
  final Function _onTap;
  final double _fontSize;

  StandardButton({
    @required String text,
    @required Function onTap,
    double fontSize = 26.0,
  })  : _text = text,
        _fontSize = fontSize,
        _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this._onTap,
      child: Container(
        height: 75,
        width: 190,
        decoration: BoxDecoration(
            color: Color(0xFF1366E5), borderRadius: BorderRadius.circular(999)),
        child: Stack(
          children: [
            BackGroundCircle(
              positionedFromLeft: 25,
              positionedFromBottom: 33,
              circleColor: Color(0xFF2375E9),
              circleSize: 50,
            ),
            BackGroundCircle(
              positionedFromLeft: 40,
              positionedFromBottom: 10,
              circleColor: Color(0xFF2375E9),
              circleSize: 18,
            ),
            BackGroundCircle(
              positionedFromLeft: 82,
              positionedFromBottom: -30,
              circleColor: Color(0xFF2375E9),
              circleSize: 75,
            ),
            Center(
                child: Text(
              this._text,
              style: TextStyle(
                  fontSize: this._fontSize,
                  color: Colors.white,
                  fontFamily: 'Neuzeit'),
            ))
          ],
        ),
      ),
    );
  }
}
