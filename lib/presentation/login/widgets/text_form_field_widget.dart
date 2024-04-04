import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String validatorMessage, label;
  final TextInputType keyboardType;
  final bool secured;

  const TextFormFieldWidget(
      {required this.controller,
      required this.validatorMessage,
      required this.label,
      required this.keyboardType,
      this.secured=false,
      super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Expanded(
      child: TextFormField(
        controller: controller,
        obscureText: secured,
        decoration: InputDecoration(
            fillColor: ColorManager.lightWhite,
            filled: true,

            constraints: BoxConstraints(
              maxHeight: height * 0.9,
              minHeight: height * 0.05,
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15)),
            labelText: label,
            labelStyle: const TextStyle(
              color: Colors.grey,
            )),
        keyboardType: keyboardType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validatorMessage;
          }
          return null;
        },
      ),
    );
  }
}
