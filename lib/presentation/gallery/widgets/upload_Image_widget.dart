import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_gallery/app/di.dart';
import 'package:my_gallery/presentation/gallery/widgets/upload_image_button.dart';
import 'package:my_gallery/presentation/resources/assets_manager.dart';
import 'package:my_gallery/presentation/resources/color_manager.dart';
import 'package:my_gallery/presentation/resources/strings_manager.dart';

import '../view_model/gallery_viewmodel.dart';

class UploadImageWidget extends StatefulWidget {
  const UploadImageWidget({super.key});

  @override
  State<UploadImageWidget> createState() => _UploadImageWidgetState();
}

class _UploadImageWidgetState extends State<UploadImageWidget> {
  final GalleryViewModel _viewModel = instance<GalleryViewModel>();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.8,
      height: height * 0.4,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Card(
        color: ColorManager.white.withOpacity(0.2),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              UploadImageButton(
                color: ColorManager.veryLightPink,
                label: AppStrings.gellary,
                image: AssetsManager.gallery,
                onTap: () async{
                  _uploadImage();
                },
              ),
              const SizedBox(
                height: 57,
              ),
              UploadImageButton(
                color: ColorManager.veryLightGreen,
                label: AppStrings.camera,
                image: AssetsManager.camera,
                onTap: () async{
                  _captureAndUploadImage();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _uploadImage() async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final image = File(pickedFile.path);
      _viewModel.uploadImage(image).then((value) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Image uploaded successfully!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      });

    }
  }

  Future _captureAndUploadImage() async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final image = File(pickedFile.path);
      _viewModel.uploadImage(image).then((value) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Image uploaded successfully!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      });

    }
  }
}
