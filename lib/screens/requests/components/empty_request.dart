import 'package:flutter/material.dart';
import 'package:fooddonationapp/res/app_colors.dart';

class EmptyRequest extends StatelessWidget {
  const EmptyRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No Requests Found',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
