
import 'bagel_ai_platform_interface.dart';

class BagelAi {
  Future<String?> getPlatformVersion() {
    return BagelAiPlatform.instance.getPlatformVersion();
  }
}
