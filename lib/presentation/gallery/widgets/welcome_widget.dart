import 'package:flutter/material.dart';

import '../../resources/strings_manager.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.welcome,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          'Kristina Dach',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
