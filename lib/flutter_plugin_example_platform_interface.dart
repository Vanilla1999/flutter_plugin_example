import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_plugin_example_method_channel.dart';

abstract class FlutterPluginExamplePlatform extends PlatformInterface {
  /// Constructs a FlutterPluginExamplePlatform.
  FlutterPluginExamplePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterPluginExamplePlatform _instance = MethodChannelFlutterPluginExample();

  /// The default instance of [FlutterPluginExamplePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterPluginExample].
  static FlutterPluginExamplePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterPluginExamplePlatform] when
  /// they register themselves.
  static set instance(FlutterPluginExamplePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
  Stream<int> get timerStream {
    throw UnimplementedError('timerStream() has not been implemented.');
  }
  Future<void> init(){
    throw UnimplementedError('init() has not been implemented.');
  }
}
