abstract class LoginEvent {}

class PhoneNumberChanged extends LoginEvent {
  final String phoneNumber;
  PhoneNumberChanged({required this.phoneNumber});
}

class LoginSubmitted extends LoginEvent {
  
}