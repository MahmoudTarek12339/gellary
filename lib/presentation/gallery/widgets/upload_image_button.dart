import 'package:flutter/material.dart';

class UploadImageButton extends StatelessWidget {
  final Color color;
  final String image, label;
  final void Function() onTap;

  const UploadImageButton(
      {required this.color,
      required this.image,
      required this.label,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 65,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: color),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(image),
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.headlineMedium,
            )
          ],
        ),
      ),
    );
  }
}
