import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:my_gallery/presentation/resources/assets_manager.dart';

import '../../resources/color_manager.dart';

class CameraWidget extends StatelessWidget {
  const CameraWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 150.0, bottom: 5),
      child: Image(
        image: AssetImage(AssetsManager.loveCamera),
        fit: BoxFit.contain,
      ),
    );
  }
}
