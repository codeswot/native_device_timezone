import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'native_device_timezone_method_channel.dart';

abstract class NativeDeviceTimezonePlatform extends PlatformInterface {
  /// Constructs a NativeDeviceTimezonePlatform.
  NativeDeviceTimezonePlatform() : super(token: _token);

  static final Object _token = Object();

  static NativeDeviceTimezonePlatform _instance =
      MethodChannelNativeDeviceTimezone();

  /// The default instance of [NativeDeviceTimezonePlatform] to use.
  ///
  /// Defaults to [MethodChannelNativeDeviceTimezone].
  static NativeDeviceTimezonePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NativeDeviceTimezonePlatform] when
  /// they register themselves.
  static set instance(NativeDeviceTimezonePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Gets the current timezone name.
  Future<String?> get timezoneName => _instance.timezoneName;

  
}
