import 'package:flutter/material.dart';
import 'package:my_gallery/presentation/gallery/widgets/chip_widget.dart';
import 'package:my_gallery/presentation/gallery/widgets/upload_Image_widget.dart';

import '../../../app/app_prefs.dart';
import '../../../app/di.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';

class LogoutUploadRowWidget extends StatelessWidget {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  LogoutUploadRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ChipWidget(
          backgroundColor: ColorManager.darkRed,
          foregroundColor: ColorManager.red,
          label: AppStrings.logout,
          icon: Icons.arrow_back,
          onTap: () {
            _appPreferences.logout().then((value) {
              Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Logged out successfully!'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );
            }).catchError((error) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("something went wrong"),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 2),
                ),
              );
            });
          },
        ),
        ChipWidget(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UploadImageWidget(),
                    ],
                  );
                },
              );
            },
            backgroundColor: ColorManager.yellow,
            foregroundColor: ColorManager.orange,
            label: AppStrings.upload,
            icon: Icons.arrow_upward),
      ],
    );
  }
}
