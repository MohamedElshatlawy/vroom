import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_room_app/utils/Enums.dart';

StateProvider bottomNavigationProvider = StateProvider<String>((ref) => PagesEnum.home);