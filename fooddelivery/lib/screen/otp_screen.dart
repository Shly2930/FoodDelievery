import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fooddelivery/component/timer_button.dart';

import '../component/app_main_button.dart';

class OtpPage extends StatefulWidget {
  OtpPage({required this.phoneNum, required this.otp});
  String phoneNum;
  String otp;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  Timer? smsTimer;

  int maxSMSSeconds = 20;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    smsTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        maxSMSSeconds = maxSMSSeconds - 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
        child: Container(
          height: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "We have sent a verification code to",
                style: TextStyle(
                    fontSize: 20, height: 1.5, color: Colors.grey.shade900),
              ),
              Text(
                "Phone Number",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    height: 1.5,
                    color: Colors.grey.shade900),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _otpTextField(first: true, last: false),
                  SizedBox(
                    width: 10,
                  ),
                  _otpTextField(first: false, last: false),
                  SizedBox(
                    width: 10,
                  ),
                  _otpTextField(first: false, last: false),
                  SizedBox(
                    width: 10,
                  ),
                  _otpTextField(first: false, last: true),
                ],
              ),
              SizedBox(
                height: 20,
                width: 150,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: TimerButton(
                          title: 'Resend SMS in ${maxSMSSeconds.toString()}',
                          onPressed: () {
                            // Navigator.pushNamed(context, "/homePage");
                          }),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TimerButton(
                          title: 'Call me',
                          onPressed: () {
                            // Navigator.pushNamed(context, "/homePage");
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _otpTextField({required bool first, last}) {
    return Container(
      width: 50,
      child: TextField(
        cursorColor: Colors.red.shade400,
        keyboardType: TextInputType.number,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.length == 0 && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        inputFormatters: [
          FilteringTextInputFormatter(RegExp("[0-9]"), allow: true),
        ],
        maxLength: 1,
        decoration: InputDecoration(
            counterText: "",
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
