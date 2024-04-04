import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_gallery/presentation/login/widgets/text_form_field_widget.dart';

import '../../../app/app_prefs.dart';
import '../../../app/di.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../view_model/login_viewmodel.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final LoginViewModel _viewModel = instance<LoginViewModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  _bind() {
    _viewModel.start();
    _emailController
        .addListener(() => _viewModel.setEmail(_emailController.text));
    _passwordController
        .addListener(() => _viewModel.setPassword(_passwordController.text));

    _viewModel.isUserLoggedInSuccessfullyStreamController.stream
        .listen((isLoggedIn) {
      if (isLoggedIn) {
        // navigate to main screen
        SchedulerBinding.instance.addPostFrameCallback((_) {
          _appPreferences.setUserLoggedIn().then((value) {
            Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Logged In successfully!'),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
              ),
            );
          }).catchError((error) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Invalid User Name or Password"),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 2),
              ),
            );
          });
        });
      }
    });
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
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: height * 0.2,
        minWidth: width * 0.5,
      ),
      child: SizedBox(
        width: width * 0.65,
        height: height * 0.5,
        child: Card(
          color: ColorManager.white.withOpacity(0.4),
          elevation: 5,
          shadowColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Expanded(
                    child: Text(
                      AppStrings.login,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  TextFormFieldWidget(
                    controller: _emailController,
                    validatorMessage: 'Please enter your Email',
                    label: AppStrings.userName,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormFieldWidget(
                    controller: _passwordController,
                    validatorMessage: 'Please enter your Password',
                    label: AppStrings.password,
                    keyboardType: TextInputType.text,
                    secured: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _viewModel.login();
                          }
                        },
                        child: Text(
                          AppStrings.submit,
                          style: TextStyle(color: ColorManager.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
