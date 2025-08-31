import 'package:flutter_test/flutter_test.dart';
import 'package:better_navbar_responsive/better_navbar_responsive.dart';
import 'package:better_navbar_responsive/better_navbar_responsive_platform_interface.dart';
import 'package:better_navbar_responsive/better_navbar_responsive_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBetterNavbarResponsivePlatform
    with MockPlatformInterfaceMixin
    implements BetterNavbarResponsivePlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<int> getNavBarHeight() => Future.value(48);
}

void main() {
  final BetterNavbarResponsivePlatform initialPlatform =
      BetterNavbarResponsivePlatform.instance;

  test('$MethodChannelBetterNavbarResponsive is the default instance', () {
    expect(
      initialPlatform,
      isInstanceOf<MethodChannelBetterNavbarResponsive>(),
    );
  });

  test('getPlatformVersion', () async {
    BetterNavbarResponsive betterNavbarResponsivePlugin =
        BetterNavbarResponsive();
    MockBetterNavbarResponsivePlatform fakePlatform =
        MockBetterNavbarResponsivePlatform();
    BetterNavbarResponsivePlatform.instance = fakePlatform;

    expect(await betterNavbarResponsivePlugin.getPlatformVersion(), '42');
  });

  test('getNavBarHeight', () async {
    BetterNavbarResponsive betterNavbarResponsivePlugin =
        BetterNavbarResponsive();
    MockBetterNavbarResponsivePlatform fakePlatform =
        MockBetterNavbarResponsivePlatform();
    BetterNavbarResponsivePlatform.instance = fakePlatform;

    expect(await betterNavbarResponsivePlugin.getNavBarHeight(), isA<int>());
  });
}
