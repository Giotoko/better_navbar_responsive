import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'better_navbar_responsive_platform_interface.dart';

/// An implementation of [BetterNavbarResponsivePlatform] that uses method channels.
class MethodChannelBetterNavbarResponsive
    extends BetterNavbarResponsivePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('better_navbar_responsive');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }

  @override
  Future<int> getNavBarHeight() async {
    if (!Platform.isAndroid) return 0;
    try {
      final int navBarHeight = await methodChannel.invokeMethod(
        'getNavBarHeight',
      );
      return navBarHeight;
    } catch (e) {
      return 0; // Fallback if channel fails
    }
  }
}
