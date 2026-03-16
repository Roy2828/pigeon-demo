import 'package:flutter_test/flutter_test.dart';
import 'package:bagel_ai/bagel_ai.dart';
import 'package:bagel_ai/bagel_ai_platform_interface.dart';
import 'package:bagel_ai/bagel_ai_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBagelAiPlatform
    with MockPlatformInterfaceMixin
    implements BagelAiPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BagelAiPlatform initialPlatform = BagelAiPlatform.instance;

  test('$MethodChannelBagelAi is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBagelAi>());
  });

  test('getPlatformVersion', () async {
    BagelAi bagelAiPlugin = BagelAi();
    MockBagelAiPlatform fakePlatform = MockBagelAiPlatform();
    BagelAiPlatform.instance = fakePlatform;

    expect(await bagelAiPlugin.getPlatformVersion(), '42');
  });
}
