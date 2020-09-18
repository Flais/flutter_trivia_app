import 'package:flutter/widgets.dart';

class BackGroundCircle extends StatelessWidget {
  final double _positionedFromBottom;
  final double _positionedFromLeft;
  final double _circleSize;
  final Color _circleColor;

  BackGroundCircle({
    @required double positionedFromBottom,
    @required double positionedFromLeft,
    @required double circleSize,
    @required Color circleColor,
  })  : _positionedFromLeft = positionedFromLeft,
        _positionedFromBottom = positionedFromBottom,
        _circleSize = circleSize,
        _circleColor = circleColor;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: this._positionedFromBottom,
      left: this._positionedFromLeft,
      child: Container(
        height: this._circleSize,
        width: this._circleSize,
        decoration: BoxDecoration(
            color: this._circleColor, borderRadius: BorderRadius.circular(999)),
      ),
    );
  }
}
