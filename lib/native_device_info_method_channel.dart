import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'native_device_info_platform_interface.dart';

/// An implementation of [NativeDeviceInfoPlatform] that uses method channels.
class MethodChannelNativeDeviceInfo extends NativeDeviceInfoPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('native_device_info');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
