import 'package:flutter/material.dart';
import 'package:fooddonationapp/res/app_colors.dart';

class ProfileField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  const ProfileField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.textInputAction,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1,
        ),
      ),
      child: TextField(
        cursorColor: AppColors.primaryColor,
        controller: controller,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
