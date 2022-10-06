abstract class LoginEvent {}

class PhoneNumberChanged extends LoginEvent {
  final String phoneNumber;
  PhoneNumberChanged({required this.phoneNumber});
}

class LoginSubmitted extends LoginEvent {
  
}

class LoginSuccessfull extends LoginEvent {
  final String otp;
  final String phoneNumber;
    LoginSuccessfull({required this.phoneNumber, required this.otp});

  
}
