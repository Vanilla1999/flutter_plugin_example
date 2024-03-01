import 'package:flutter_plugin_example/flutter_plugin_example.dart';
import 'package:flutter_plugin_example/src/flutter_plugin_example_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';


import 'package:flutter_plugin_example/src/flutter_plugin_example_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterPluginExamplePlatform
    with MockPlatformInterfaceMixin
    implements FlutterPluginExamplePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> init() {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  // TODO: implement timerStream
  Stream<int> get timerStream => throw UnimplementedError();
}

void main() {
  final FlutterPluginExamplePlatform initialPlatform = FlutterPluginExamplePlatform.instance;

  test('$MethodChannelFlutterPluginExample is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterPluginExample>());
  });

  test('getPlatformVersion', () async {
    FlutterPluginExample flutterPluginExamplePlugin = FlutterPluginExample();
    MockFlutterPluginExamplePlatform fakePlatform = MockFlutterPluginExamplePlatform();
    FlutterPluginExamplePlatform.instance = fakePlatform;

    expect(await flutterPluginExamplePlugin.getPlatformVersion(), '42');
  });
}
