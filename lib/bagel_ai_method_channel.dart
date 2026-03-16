import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'bagel_ai_platform_interface.dart';

/// An implementation of [BagelAiPlatform] that uses method channels.
class MethodChannelBagelAi extends BagelAiPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('bagel_ai');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
