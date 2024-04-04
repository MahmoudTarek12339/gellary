import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';

class ImageItem extends StatelessWidget {
  final String image;

  const ImageItem(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 108,
          maxHeight: 108,
          minHeight: 70,
          minWidth: 70,
        ),
        width: 80,
        height: 80,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorManager.white,
        ),
        child: Image(
          fit: BoxFit.cover,
          image: NetworkImage(image),
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
