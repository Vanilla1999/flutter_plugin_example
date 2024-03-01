


import 'package:flutter_plugin_example/src/flutter_plugin_example_platform_interface.dart';

class FlutterPluginExample {
  Future<String?> getPlatformVersion() {
    return FlutterPluginExamplePlatform.instance.getPlatformVersion();
  }
  Stream<int> get timerStream => FlutterPluginExamplePlatform.instance.timerStream;

  Future<void> init() async {
    FlutterPluginExamplePlatform.instance.init();
  }
}
