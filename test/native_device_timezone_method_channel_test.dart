import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:native_device_timezone/native_device_timezone_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelNativeDeviceTimezone platform =
      MethodChannelNativeDeviceTimezone();
  const MethodChannel channel = MethodChannel('native_device_timezone');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.timezoneName, '42');
  });
}
