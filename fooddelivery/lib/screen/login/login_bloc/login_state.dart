class LoginState {
  const LoginState({this.phoneNumber = ""});

  final String phoneNumber;
  // final Formsu

  bool get isValidPhoneNum {
    print("phone is == $phoneNumber");
    if (phoneNumber.length == 10) {
      return true;
    } else {
      return false;
    }
  }

  LoginState copyWith({
    String? phoneNumber,
  }) {
    return LoginState(phoneNumber: phoneNumber ?? this.phoneNumber);
  }
}
