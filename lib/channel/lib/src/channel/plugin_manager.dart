
import 'channel.g.dart';



//这个不是自动生成的
class PluginManager {
  static PluginManager? _instance;

  PluginManager._();

  static PluginManager get instance => _instance ??= PluginManager._();

  FlutterCallNativeApi flutterCallNativeApi = FlutterCallNativeApi();
}
