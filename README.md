# hungtq_native_device_info

A Flutter plugin that demonstrates how to use Method Channel to get the native platform version (Android and iOS).

## Getting Started

To use this plugin, add `hungtq_native_device_info` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  hungtq_native_device_info: ^1.0.0
```

## Usage

Import the package and call `getPlatformVersion`:

```dart
import 'package:hungtq_native_device_info/hungtq_native_device_info.dart';

final nativeDeviceInfo = NativeDeviceInfo();
String? platformVersion = await nativeDeviceInfo.getPlatformVersion();
print('Platform version: $platformVersion');
```

## Features

- Get Android version (e.g., "Android 13")
- Get iOS version (e.g., "iOS 17.0")

## How it works

This plugin uses `MethodChannel` to communicate between Dart and the native platforms (Kotlin for Android and Swift for iOS).

- **Dart**: Sends a request with the method name `getPlatformVersion`.
- **Android**: Responds with `android.os.Build.VERSION.RELEASE`.
- **iOS**: Responds with `UIDevice.current.systemVersion`.
