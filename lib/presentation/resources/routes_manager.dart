import 'package:flutter/material.dart';
import 'package:my_gallery/presentation/gallery/view/gallery_view.dart';
import 'package:my_gallery/presentation/login/view/login_view.dart';
import 'package:my_gallery/presentation/resources/strings_manager.dart';

class Routes {
  static const String loginRoute = "/";
  static const String mainRoute = "/main";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRoute:
        //todo di
        //initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.mainRoute:
        //todo di
        //initHomeModule();
        return MaterialPageRoute(builder: (_) => const GalleryView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
