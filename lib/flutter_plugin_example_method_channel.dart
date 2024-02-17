import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_plugin_example_platform_interface.dart';

/// An implementation of [FlutterPluginExamplePlatform] that uses method channels.
class MethodChannelFlutterPluginExample extends FlutterPluginExamplePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_plugin_example');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
        'getPlatformVersion');
    return version;
  }

  StreamController<int> _timerController = StreamController.broadcast();

  @override
  // TODO: implement timerStream
  Stream<int> get timerStream => _timerController.stream.asBroadcastStream();

  @override
  Future<void> init() async{
    methodChannel.setMethodCallHandler((call) async{
      debugPrint(call.toString());
      if(call.method.toString() == 'timer'){
        _timerController.add(call.arguments);
      }
    });
  }

}
