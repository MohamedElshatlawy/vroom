import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final otpProvider=ChangeNotifierProvider<OtpProvider>((ref)=>OtpProvider());

class OtpProvider extends ChangeNotifier{

  AuthCredential _phoneAuthCredential;
  String _verificationId;
  int _code;
  User _firebaseUser;

  String errorMessage='------';

  Future<String> submitPhoneNumber({String mobileNumber}) async {
    /// NOTE: Either append your phone number country code or add in the code itself
    /// Since I'm in India we use "+91 " as prefix `phoneNumber`
    String phoneNumber = "+2"+mobileNumber.trim();
    print(phoneNumber);

    /// The below functions are the callbacks, separated so as to make code more redable
    void verificationCompleted(AuthCredential phoneAuthCredential) {
      print('verificationCompleted');

      this._phoneAuthCredential = phoneAuthCredential;
      log('our phone AuthCredential'+phoneAuthCredential.toString());

    }

    void verificationFailed(FirebaseAuthException error) {
      print('verificationFailed');
      log('our error'+error.message);
    }

    void codeSent(String verificationId, [int code]) {
      print('codeSent');
      this._verificationId = verificationId;
      print('verificationId : '+verificationId);
      this._code = code;
      print('our new code '+code.toString());

    }

    void codeAutoRetrievalTimeout(String verificationId) {
      print('codeAutoRetrievalTimeout');
    }

    await FirebaseAuth.instance.verifyPhoneNumber(
      /// Make sure to prefix with your country code
      phoneNumber: phoneNumber,

      /// `seconds` didn't work. The underlying implementation code only reads in `millisenconds`
      timeout: Duration(seconds: 60),

      /// If the SIM (with phoneNumber) is in the current device this function is called.
      /// This function gives `AuthCredential`. Moreover `login` function can be called from this callback
      /// When this function is called there is no need to enter the OTP, you can click on Login button to sigin directly as the device is now verified
      verificationCompleted: verificationCompleted,

      /// Called when the verification is failed
      verificationFailed: verificationFailed,

      /// This is called after the OTP is sent. Gives a `verificationId` and `code`
      codeSent: codeSent,

      /// After automatic code retrival `tmeout` this function is called
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    ); // All the callbacks are above

    notifyListeners();

    return _code.toString();
  }

  Future<String> submitOTP({String smsCode}) async {
    /// get the `smsCode` from the user
    log('vefid'+ _verificationId);
    /// when used different phoneNumber other than the current (running) device
    /// we need to use OTP to get `phoneAuthCredential` which is inturn used to signIn/login
    this._phoneAuthCredential = await PhoneAuthProvider.credential(
        verificationId: this._verificationId, smsCode: smsCode.trim());

    log('our Code '+this._phoneAuthCredential.token.toString());
    final userId= await _loginFirebase();
    notifyListeners();
    return userId;

  }

  Future<String> _loginFirebase() async {
    /// This method is used to login the user
    /// `AuthCredential`(`_phoneAuthCredential`) is needed for the signIn method
    /// After the signIn method from `AuthResult` we can get `FirebaserUser`(`_firebaseUser`)

    String userId='';
    try {
      await FirebaseAuth.instance
          .signInWithCredential(this._phoneAuthCredential)
          .then((UserCredential authRes) {
        _firebaseUser = authRes.user;
        userId=_firebaseUser.uid;
      }).catchError((e) {
        print(e.toString());
        errorMessage=e.toString();
      } );

    } catch (e) {
      print(e.toString());
      errorMessage=e.toString();
    }
    notifyListeners();
    return userId;
  }
}