import 'dart:async';
import 'dart:developer';

import 'package:my_gallery/domain/usecase/login_usecase.dart';
import 'package:my_gallery/presentation/base/base_view_model.dart';

import '../../common/freezed_data/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  final StreamController _areAllInputsValidStreamController =
      StreamController<void>.broadcast();
  StreamController isUserLoggedInSuccessfullyStreamController =
      StreamController<bool>();

  LoginObject loginObject = LoginObject("", "");

  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);

  @override
  void start() {
    //inputState.add(ContentState());
  }

  @override
  void dispose() {
    super.dispose();
    _emailStreamController.close();
    _passwordStreamController.close();
    _areAllInputsValidStreamController.close();
    isUserLoggedInSuccessfullyStreamController.close();
  }

  @override
  login() async {
    (await _loginUseCase.execute(
            LoginUseCaseInput(loginObject.userName, loginObject.password)))
        .fold(
            (failure) => log(failure
                .message) /*inputState.add(ErrorState(
          StateRendererType.popupErrorState,
          failure.message,
        )*/
            , (data) {
      /*inputState.add(ContentState());*/
      isUserLoggedInSuccessfullyStreamController.add(true);
    });
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    loginObject = loginObject.copyWith(userName: email);
    inputIsAllInputsValid.add(null);
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    inputIsAllInputsValid.add(null);
  }

  //inputs
  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputIsAllInputsValid => _areAllInputsValidStreamController.sink;

}

mixin LoginViewModelInputs {
  login();

  setEmail(String email);

  setPassword(String password);

  Sink get inputEmail;

  Sink get inputPassword;

  Sink get inputIsAllInputsValid;
}

mixin LoginViewModelOutputs {
}
