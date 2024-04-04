import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';

class ChipWidget extends StatelessWidget {
  final Color backgroundColor, foregroundColor;
  final String label;
  final IconData icon;
  final void Function() onTap;

  const ChipWidget(
      {required this.backgroundColor,
      required this.foregroundColor,
      required this.label,
      required this.icon,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: width * 0.35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: [
            ColorManager.white.withOpacity(0.57),
            ColorManager.white.withOpacity(0.43),
          ]),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: foregroundColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Icon(
                    icon,
                    color: ColorManager.white,
                    size: 32,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
