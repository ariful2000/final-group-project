import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;

  const HomeField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.textInputAction,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: MediaQuery.of(context).size.width * 0.43,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
          ),
          alignment: Alignment.center,
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.43 - 20,
              child: TextField(
                cursorColor: Colors.black,
                controller: controller,
                textInputAction: textInputAction,
                onChanged: onChanged,
                style: const TextStyle(color: Colors.black, fontSize: 20.0),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(bottom: 6.0),
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
