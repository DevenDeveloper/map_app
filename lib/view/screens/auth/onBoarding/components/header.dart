import 'package:flutter/material.dart';
import 'package:map_app/core/utils/images.dart';

class Header extends StatelessWidget {
  final double? firstImageHeight;
  final double? secondImageHeight;

  const Header({
    super.key,
    this.firstImageHeight,
    this.secondImageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        children: [
          Image.asset(MyImages.appLogo, height: firstImageHeight ?? 50),
          Image.asset(MyImages.appTagLine, height: secondImageHeight ?? 33),
        ],
      ),
    );
  }
}
