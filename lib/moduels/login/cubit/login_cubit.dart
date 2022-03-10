import 'package:matgar/componant/const.dart';
import 'package:matgar/componant/constant.dart';
import 'package:matgar/model/users.dart';
import 'package:matgar/moduels/login/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgar/shared/network/dio_helper.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;
  void createNewUser({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(CreateUserLoading());
    DioHelper.postData(path: kRegister, data: {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
    }).then((value) {
      userModel = UserModel.fromjson(value.data);
      print(value.data);
      emit(CreateUserSucsses());
    }).catchError((er) {
      emit(CreateUserError());

      print(er.toString());
    });
  }

  void loginUser({
    required String email,
    required String password,
  }) {
    emit(LoginWithEmailLoading());
    DioHelper.postData(path: kLogin, data: {
      'email': email,
      'password': password,
    }).then((value) {
      userModel = UserModel.fromjson(value.data);
      print(value.data);
      emit(LoginWithEmailSucsses(userModel!.data!.token));
    }).catchError((er) {
      emit(LoginWithEmailError());

      print(er.toString());
    });
  }
}
