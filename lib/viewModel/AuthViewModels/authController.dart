import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
StateProvider authLoadingProvider = StateProvider<bool>((ref) => false);
StateProvider forgetPasswordLoadingProvider = StateProvider<bool>((ref) => false);
StateProvider resetPasswordLoadingProvider = StateProvider<bool>((ref) => false);
StateProvider fcmTokenProvider = StateProvider<String>((ref) => '');
StateProvider phoneCodeProvider = StateProvider<String>((ref) => '966');
