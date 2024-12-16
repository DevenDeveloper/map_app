
import 'package:flutter/material.dart';
import 'package:map_app/core/utils/dimensions.dart';
import 'package:map_app/core/utils/style.dart';

class UserDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const UserDetailRow({
    required this.label,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Dimensions.space10, left: Dimensions.space17),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: mediumMediumLarge.copyWith(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              value,
              style: mediumMediumLarge,
            ),
          ),
        ],
      ),
    );
  }
}
