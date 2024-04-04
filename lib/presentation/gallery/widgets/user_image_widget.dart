import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gallery/presentation/resources/color_manager.dart';

class UserImageWidget extends StatelessWidget {
  const UserImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.only(bottomLeft: Radius.circular(30)),
          color: ColorManager.veryLightPurple),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: ColorManager.white,
        child: ClipRRect(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          borderRadius: BorderRadius.circular(25),
          child: const Image(
            image: NetworkImage(
                'https://i.pinimg.com/236x/26/18/e6/2618e67535f8e0091b42cb2a0de5d40c.jpg'),
          ),
        ),
      ),
    );
  }
}
