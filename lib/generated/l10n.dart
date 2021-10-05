// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `No internet connection, please check you network and try again`
  String get no_internet_connection {
    return Intl.message(
      'No internet connection, please check you network and try again',
      name: 'no_internet_connection',
      desc: '',
      args: [],
    );
  }

  /// `Internal Server Error`
  String get internal_server_error {
    return Intl.message(
      'Internal Server Error',
      name: 'internal_server_error',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get pageHomeConfirm {
    return Intl.message(
      'Confirm',
      name: 'pageHomeConfirm',
      desc: '',
      args: [],
    );
  }

  /// `mm {name}`
  String pageHomeWelcome(Object name) {
    return Intl.message(
      'mm $name',
      name: 'pageHomeWelcome',
      desc: '',
      args: [name],
    );
  }

  /// `Trucks Type`
  String get trucksType {
    return Intl.message(
      'Trucks Type',
      name: 'trucksType',
      desc: '',
      args: [],
    );
  }

  /// `payload`
  String get payload {
    return Intl.message(
      'payload',
      name: 'payload',
      desc: '',
      args: [],
    );
  }

  /// `Offers`
  String get offers {
    return Intl.message(
      'Offers',
      name: 'offers',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Lower To Higher`
  String get filterLTH {
    return Intl.message(
      'Lower To Higher',
      name: 'filterLTH',
      desc: '',
      args: [],
    );
  }

  /// `Higher To Lower`
  String get filterHTL {
    return Intl.message(
      'Higher To Lower',
      name: 'filterHTL',
      desc: '',
      args: [],
    );
  }

  /// `Book a truck in your city`
  String get introTitle1 {
    return Intl.message(
      'Book a truck in your city',
      name: 'introTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Choose between many offers`
  String get introTitle2 {
    return Intl.message(
      'Choose between many offers',
      name: 'introTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Fast and save`
  String get introTitle3 {
    return Intl.message(
      'Fast and save',
      name: 'introTitle3',
      desc: '',
      args: [],
    );
  }

  /// `You do not have to wait , now its easy to book any kind Of trucks in your city with one click`
  String get introDesc1 {
    return Intl.message(
      'You do not have to wait , now its easy to book any kind Of trucks in your city with one click',
      name: 'introDesc1',
      desc: '',
      args: [],
    );
  }

  /// `Now you can see many offers to deliver your goods And easy to compare between them`
  String get introDesc2 {
    return Intl.message(
      'Now you can see many offers to deliver your goods And easy to compare between them',
      name: 'introDesc2',
      desc: '',
      args: [],
    );
  }

  /// `You can eat at expensive restaurants with affordable price`
  String get introDesc3 {
    return Intl.message(
      'You can eat at expensive restaurants with affordable price',
      name: 'introDesc3',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Before Enjoying Vrooom Services\nPlease Register First`
  String get registerFirst {
    return Intl.message(
      'Before Enjoying Vrooom Services\nPlease Register First',
      name: 'registerFirst',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signIn {
    return Intl.message(
      'Sign in',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `By Logging In Or Registering, You Have Agreed To`
  String get byLogin {
    return Intl.message(
      'By Logging In Or Registering, You Have Agreed To',
      name: 'byLogin',
      desc: '',
      args: [],
    );
  }

  /// ` The Terms And Conditions `
  String get termsAndConditions {
    return Intl.message(
      ' The Terms And Conditions ',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `And`
  String get and {
    return Intl.message(
      'And',
      name: 'and',
      desc: '',
      args: [],
    );
  }

  /// ` Privacy Policy.`
  String get privacy {
    return Intl.message(
      ' Privacy Policy.',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your full Name`
  String get fullNameHint {
    return Intl.message(
      'Enter your full Name',
      name: 'fullNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get register {
    return Intl.message(
      'Registration',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password `
  String get forgetPassword {
    return Intl.message(
      'Forget Password ',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your registered phone below`
  String get enterPhone {
    return Intl.message(
      'Enter your registered phone below',
      name: 'enterPhone',
      desc: '',
      args: [],
    );
  }

  /// `Enter your registered email below`
  String get enterEmail {
    return Intl.message(
      'Enter your registered email below',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Remember the password ?`
  String get rememberPassword {
    return Intl.message(
      'Remember the password ?',
      name: 'rememberPassword',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Please check your phone for reset code`
  String get checkPhone {
    return Intl.message(
      'Please check your phone for reset code',
      name: 'checkPhone',
      desc: '',
      args: [],
    );
  }

  /// `Can't get email ?`
  String get canNotGetEmail {
    return Intl.message(
      'Can\'t get email ?',
      name: 'canNotGetEmail',
      desc: '',
      args: [],
    );
  }

  /// `Resubmit`
  String get reSubmit {
    return Intl.message(
      'Resubmit',
      name: 'reSubmit',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations your password has\nbeen changed,`
  String get congratulation {
    return Intl.message(
      'Congratulations your password has\nbeen changed,',
      name: 'congratulation',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Rate Us`
  String get rate {
    return Intl.message(
      'Rate Us',
      name: 'rate',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Recent`
  String get recent {
    return Intl.message(
      'Recent',
      name: 'recent',
      desc: '',
      args: [],
    );
  }

  /// `Current`
  String get current1 {
    return Intl.message(
      'Current',
      name: 'current1',
      desc: '',
      args: [],
    );
  }

  /// `View Offers`
  String get viewOffers {
    return Intl.message(
      'View Offers',
      name: 'viewOffers',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `View details`
  String get viewDetails {
    return Intl.message(
      'View details',
      name: 'viewDetails',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}