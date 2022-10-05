import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooddelivery/screen/login/login_bloc/login_event.dart';
import 'package:fooddelivery/screen/login/login_bloc/login_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<PhoneNumberChanged>(_onPhoneNumChanged);
    on<LoginSubmitted>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(
      LoginSubmitted event, Emitter<LoginState> emit) async {}

  void _onPhoneNumChanged(PhoneNumberChanged event, Emitter<LoginState> emit) {
    final phone = event.phoneNumber;
    emit(
      state.copyWith(
        phoneNumber: phone,
      ),
    );
  }
}
