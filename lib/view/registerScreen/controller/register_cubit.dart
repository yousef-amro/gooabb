import 'package:bloc/bloc.dart';
import 'package:gooabb/core/model/register_model.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  RegisterModel registerModel = RegisterModel();
}
