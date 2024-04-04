import 'package:flutter/material.dart';

import '../../resources/strings_manager.dart';

class GellaryTextWidget extends StatelessWidget {
  const GellaryTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.myGellary,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
