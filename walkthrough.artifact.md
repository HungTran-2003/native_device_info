# Walkthrough: Creating a Flutter Plugin with Method Channel

We have successfully created a Flutter plugin named `native_device_info` that uses Method Channel to communicate with native Android and iOS.

## Project Structure

- **Dart API**: [lib/native_device_info.dart](file:///D:/study/package_native/native_device_info/lib/native_device_info.dart)
- **Android Implementation**: [android/src/main/kotlin/com/example/native_device_info/NativeDeviceInfoPlugin.kt](file:///D:/study/package_native/native_device_info/android/src/main/kotlin/com/example/native_device_info/NativeDeviceInfoPlugin.kt)
- **iOS Implementation**: [ios/native_device_info/Sources/native_device_info/NativeDeviceInfoPlugin.swift](file:///D:/study/package_native/native_device_info/ios/native_device_info/Sources/native_device_info/NativeDeviceInfoPlugin.swift)
- **Example App**: [example/lib/main.dart](file:///D:/study/package_native/native_device_info/example/lib/main.dart)

## Key Components

### 1. Dart Method Channel
The Dart side uses `MethodChannel` to invoke a method named `getPlatformVersion`.

```dart
final methodChannel = const MethodChannel('native_device_info');
final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
```

### 2. Android (Kotlin)
The Android side registers a `MethodCallHandler` and handles the `getPlatformVersion` call.

```kotlin
override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
        result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else {
        result.notImplemented()
    }
}
```

### 3. iOS (Swift)
The iOS side also registers a handler and returns the system version.

```swift
public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
  switch call.method {
  case "getPlatformVersion":
    result("iOS " + UIDevice.current.systemVersion)
  default:
    result(FlutterMethodNotImplemented)
  }
}
```

## Publishing to pub.dev

The package has been prepared for publishing. A dry-run has been performed successfully.

### Steps to publish:
1.  **Update `pubspec.yaml`**: Add your real `homepage` or `repository` URL.
2.  **Verify locally**: Run `flutter pub publish --dry-run` one last time.
3.  **Publish**: Run `flutter pub publish`.
    - You will be asked to authenticate with your Google account.
    - Follow the prompts in the terminal.

> [!IMPORTANT]
> Once published, versions cannot be deleted. Make sure everything is correct before running the final publish command.
