import 'package:flutter/material.dart';
import 'package:map_app/core/utils/dimensions.dart';
import 'package:map_app/core/utils/style.dart';

class LoginTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const LoginTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.space15,
        right: Dimensions.space15,
        top: Dimensions.space15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: mediumOverLarge.copyWith(
              fontSize: Dimensions.fontOverLarge,
            ),
          ),
          Text(
            subtitle,
            style: mediumDefault.copyWith(
              fontSize: Dimensions.fontDefault,
            ),
          ),
        ],
      ),
    );
  }
}
