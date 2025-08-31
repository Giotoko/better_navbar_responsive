import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:better_navbar_responsive/better_navbar_responsive_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelBetterNavbarResponsive platform =
      MethodChannelBetterNavbarResponsive();
  const MethodChannel channel = MethodChannel('better_navbar_responsive');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          return '42';
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
  test('getNavBarHeight', () async {
    expect(await platform.getNavBarHeight(), isA<int>());
  });
}
