import 'package:flutter_test/flutter_test.dart';
import 'package:native_device_timezone/native_device_timezone.dart';
import 'package:native_device_timezone/native_device_timezone_platform_interface.dart';
import 'package:native_device_timezone/native_device_timezone_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNativeDeviceTimezonePlatform
    with MockPlatformInterfaceMixin
    implements NativeDeviceTimezonePlatform {
  @override
  Future<String?> get timezoneName => Future<String?>.value('42');
}

void main() {
  final NativeDeviceTimezonePlatform initialPlatform =
      NativeDeviceTimezonePlatform.instance;

  test('$MethodChannelNativeDeviceTimezone is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNativeDeviceTimezone>());
  });

  test('getPlatformVersion', () async {
    MockNativeDeviceTimezonePlatform fakePlatform =
        MockNativeDeviceTimezonePlatform();
    NativeDeviceTimezonePlatform.instance = fakePlatform;

    expect(await NativeDeviceTimezone.timezoneName, '42');
  });
}
