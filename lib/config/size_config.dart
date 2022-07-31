import 'package:flutter/material.dart';

//SizeConfig().init(context); call always in main screen

class SizeConfig {
  static MediaQueryData? _mediaqueryData;
  static double? screenHeight;
  static double? screenWidth;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaqueryData = MediaQuery.of(context);

    screenHeight = _mediaqueryData!.size.height;
    screenWidth = _mediaqueryData!.size.width;
    orientation = _mediaqueryData!.orientation;
  }
}

double getProportionateHeight(double inputHeight) {
  double? screenHeight = SizeConfig.screenHeight;
  return ((inputHeight / 800) * screenHeight!);
}

double getProportionateWidth(double inputWidth) {
  double? screenWidth = SizeConfig.screenWidth;
  return ((inputWidth / 400) * screenWidth!);
}

// For add free space vertically
class VerticalSpacing extends StatelessWidget {
  final double h;

  const VerticalSpacing({
    Key? key,
    this.h = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateHeight(h),
    );
  }
}

// For add free space Horizontally
class HorizontalSpacing extends StatelessWidget {
  final double w;

  const HorizontalSpacing({
    Key? key,
    this.w = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateWidth(w),
    );
  }
}
