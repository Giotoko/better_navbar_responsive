import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'better_navbar_responsive_method_channel.dart';

abstract class BetterNavbarResponsivePlatform extends PlatformInterface {
  /// Constructs a BetterNavbarResponsivePlatform.
  BetterNavbarResponsivePlatform() : super(token: _token);

  static final Object _token = Object();

  static BetterNavbarResponsivePlatform _instance = MethodChannelBetterNavbarResponsive();

  /// The default instance of [BetterNavbarResponsivePlatform] to use.
  ///
  /// Defaults to [MethodChannelBetterNavbarResponsive].
  static BetterNavbarResponsivePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BetterNavbarResponsivePlatform] when
  /// they register themselves.
  static set instance(BetterNavbarResponsivePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<int> getNavBarHeight() {
    throw UnimplementedError('getNavBarHeight() has not been implemented.');
  }
}
