import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'bagel_ai_method_channel.dart';

abstract class BagelAiPlatform extends PlatformInterface {
  /// Constructs a BagelAiPlatform.
  BagelAiPlatform() : super(token: _token);

  static final Object _token = Object();

  static BagelAiPlatform _instance = MethodChannelBagelAi();

  /// The default instance of [BagelAiPlatform] to use.
  ///
  /// Defaults to [MethodChannelBagelAi].
  static BagelAiPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BagelAiPlatform] when
  /// they register themselves.
  static set instance(BagelAiPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
