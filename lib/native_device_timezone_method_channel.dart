import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'native_device_timezone_platform_interface.dart';

/// An implementation of [NativeDeviceTimezonePlatform] that uses method channels.
class MethodChannelNativeDeviceTimezone extends NativeDeviceTimezonePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('native_device_timezone');

  @override
  Future<String?> get timezoneName async {
    final String? timezoneName =
        await methodChannel.invokeMethod<String>('getTimezoneName');
    return timezoneName;
  }
}
