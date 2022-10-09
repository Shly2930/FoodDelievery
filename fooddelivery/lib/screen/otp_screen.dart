import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fooddelivery/component/timer_button.dart';
import 'package:async/async.dart';

import '../component/app_main_button.dart';

class OtpPage extends StatefulWidget {
  OtpPage({required this.phoneNum, required this.otp});
  String phoneNum;
  String otp;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late Timer? smsTimer;
  late Timer? callTimer;

  int maxSMSSeconds = 10;
  int maxCallSeconds = 10;

  bool showSMSMsg = false;
  bool resendSMSButtonDisabled = true;

  @override
  void initState() {
    super.initState();

    startSMSTimer();
    startCallTimer();
  }

  void startSMSTimer() {
    resendSMSButtonDisabled = true;
    smsTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (maxSMSSeconds > 0) {
          maxSMSSeconds = maxSMSSeconds - 1;
        } else {
          stopSMSTimer();
          return;
        }
      });
    });
  }

  void startCallTimer() {
    callTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (maxCallSeconds > 0) {
          maxCallSeconds = maxCallSeconds - 1;
        } else {
          stopCallTimer();
          return;
        }
      });
    });
  }

  void stopSMSTimer() {
    resendSMSButtonDisabled = false;
    smsTimer?.cancel();
  }

  void stopCallTimer() {
    callTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                this.widget.phoneNum,
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
              Text(showSMSMsg ? "new otp has sent" : ""),
              SizedBox(
                height: 20,
                width: 150,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: TimerButton(
                        title: maxSMSSeconds > 0
                            ? 'Resend SMS in ${maxSMSSeconds.toString()}'
                            : "Resend SMS",
                        onPressed: resendSMSButtonDisabled
                            ? null
                            : () {
                                setState(() {
                                  maxSMSSeconds = 10;
                                  startSMSTimer();
                                });

                                print("Resend SMS Clicked");
                              },
                        enabled: maxSMSSeconds > 0 ? false : true,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TimerButton(
                        title: maxCallSeconds > 0
                            ? 'Call me in ${maxCallSeconds.toString()}'
                            : 'Call Back',
                        onPressed: () {
                          setState(() {
                            maxCallSeconds = 10;
                            startCallTimer();
                          });
                        },
                        enabled: maxCallSeconds > 0 ? false : true,
                      ),
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
