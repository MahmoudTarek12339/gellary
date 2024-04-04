import 'package:flutter/material.dart';
import 'package:my_gallery/presentation/login/widgets/camera_widget.dart';
import 'package:my_gallery/presentation/login/widgets/gellary_text_widget.dart';
import 'package:my_gallery/presentation/login/widgets/login_card.dart';
import 'package:my_gallery/presentation/resources/color_manager.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorManager.veryLightPink,
              ColorManager.lightPink,
              ColorManager.lightPurple,
              ColorManager.white
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topRight,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const CameraWidget(),
                  const GellaryTextWidget(),
                  const SizedBox(
                    height: 15,
                  ),
                  LoginCard(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
