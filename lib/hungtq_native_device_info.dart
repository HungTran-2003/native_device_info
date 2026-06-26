
import 'native_device_info_platform_interface.dart';

class NativeDeviceInfo {
  Future<String?> getPlatformVersion() {
    return NativeDeviceInfoPlatform.instance.getPlatformVersion();
  }
}
