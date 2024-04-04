import 'package:flutter/material.dart';
import 'package:my_gallery/presentation/gallery/widgets/images_widget.dart';
import 'package:my_gallery/presentation/gallery/widgets/logout_upload_row_widget.dart';
import 'package:my_gallery/presentation/gallery/widgets/user_image_widget.dart';
import 'package:my_gallery/presentation/gallery/widgets/welcome_widget.dart';

import '../../resources/color_manager.dart';

class GalleryView extends StatelessWidget {
  const GalleryView({super.key});

  @override
  Widget build(BuildContext context) {
    //final double height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorManager.white,
            ColorManager.veryLightPink,
            ColorManager.lightPink,
            ColorManager.lightPurple,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Padding(
                padding: const EdgeInsets.all(27.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const WelcomeWidget(),
                    const SizedBox(
                      height: 43,
                    ),
                    LogoutUploadRowWidget(),
                    const SizedBox(
                      height: 47,
                    ),
                    const ImagesWidget()
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 27.0),
                child: UserImageWidget(),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
