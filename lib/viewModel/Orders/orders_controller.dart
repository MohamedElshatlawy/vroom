import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
///create order
final startingPointProvider = StateProvider<LatLng>((ref) => null );
final startingAddressProvider = StateProvider<String>((ref) => null );
final endingPointProvider = StateProvider<LatLng>((ref) => null );
final endingAddressProvider = StateProvider<String>((ref) => null );
final orderDateProvider = StateProvider<String>((ref) => null );
final orderTimeProvider = StateProvider<String>((ref) => null );
final createOrderMarkersProvider = StateProvider<Map<MarkerId, Marker>>((ref) => {});
StateProvider addOrderLoadingProvider = StateProvider<bool>((ref) => false);


///edit order
final editStartingPointProvider = StateProvider<LatLng>((ref) => null );
final editStartingAddressProvider = StateProvider<String>((ref) => null );
final editEndingPointProvider = StateProvider<LatLng>((ref) => null );
final editEndingAddressProvider = StateProvider<String>((ref) => null );
final editOrderDateProvider = StateProvider<String>((ref) => null );
final editOrderTimeProvider = StateProvider<String>((ref) => null );
final editOrderMarkersProvider = StateProvider<Map<MarkerId, Marker>>((ref) => {});
StateProvider editOrderLoadingProvider = StateProvider<bool>((ref) => false);
