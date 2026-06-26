import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:native_device_info/native_device_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Chưa xác định';
  final _nativeDeviceInfoPlugin = NativeDeviceInfo();

  @override
  void initState() {
    super.initState();
    _getPlatformVersion();
  }

  // Hàm gọi Method Channel để lấy phiên bản hệ điều hành
  Future<void> _getPlatformVersion() async {
    String platformVersion;
    try {
      // Gọi hàm từ package native_device_info
      platformVersion = await _nativeDeviceInfoPlugin.getPlatformVersion() ?? 'Không lấy được phiên bản';
    } on PlatformException {
      platformVersion = 'Lỗi khi gọi Native code.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Native Device Info Example'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Phiên bản hệ điều hành hiện tại:',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                _platformVersion,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _getPlatformVersion,
                child: const Text('Lấy lại phiên bản'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
