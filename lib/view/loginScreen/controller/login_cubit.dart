import 'package:bloc/bloc.dart';
import 'package:gooabb/core/model/login_model.dart';
import 'package:gooabb/view/loginScreen/controller/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LoginModel loginModel = LoginModel();
}
