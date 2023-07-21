import 'native_device_timezone_platform_interface.dart';

class NativeDeviceTimezone {
  /// Gets the current timezone name.
  static Future<String?> get timezoneName =>
      NativeDeviceTimezonePlatform.instance.timezoneName;
}
