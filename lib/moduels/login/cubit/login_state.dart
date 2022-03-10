abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginWithEmailLoading extends LoginState {}

class LoginWithEmailSucsses extends LoginState {
  String? token;
  LoginWithEmailSucsses(this.token);
}

class LoginWithEmailError extends LoginState {}

class LoginWithGoogleLoading extends LoginState {}

class LoginWithGoogleSucsses extends LoginState {}

class LoginWithGoogleError extends LoginState {}

class LoginWithFacebookLoading extends LoginState {}

class LoginWithFacebookSucsses extends LoginState {}

class LoginWithFacebookError extends LoginState {}

class CreateUserLoading extends LoginState {}

class CreateUserSucsses extends LoginState {}

class CreateUserError extends LoginState {}

class SaveUserDataLoading extends LoginState {}

class SaveUserDataSucsses extends LoginState {}

class SaveUserDataError extends LoginState {}

class SaveDataLoading extends LoginState {}

class SaveDataSucsses extends LoginState {}

class SaveDataError extends LoginState {}
