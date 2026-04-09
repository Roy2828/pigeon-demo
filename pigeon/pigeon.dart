/*
 * @Author: Very
 * @LastEditors: Very
 * @Description: 
 * handsome boy
 */
import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/channel/lib/src/channel/channel.g.dart',
  dartOptions: DartOptions(),
  kotlinOut: 'pigeon/output/Messages.kt',
  kotlinOptions: KotlinOptions(),
  javaOut: 'pigeon/output/Messages.java',
  javaOptions: JavaOptions(),
  swiftOut: 'pigeon/output/Messages.swift',
  swiftOptions: SwiftOptions(),
  objcHeaderOut: 'pigeon/output/BGLMessages.h',
  objcSourceOut: 'pigeon/output/BGLMessages.m',
  // Set this to a unique prefix for your plugin or application, per Objective-C naming conventions.
  objcOptions: ObjcOptions(prefix: 'BGL'),
  dartPackageName: 'pigeon_example_package',
))


@HostApi()     //flutter调用原生
abstract class FlutterCallNativeApi {
  AppInfo getAppInfo();

  @async
  void sensorAddTrack(String eventName, Map<String, Object> paramsMap);//神策：添加埋点


  String sensorGetPresetProperty(String propertyName);//神策：获取预制属性

   @async
    String getTest();

}

class AppInfo {
  bool? isProductionEnv;
  String? jPushId;
  String? projectName;
}

@FlutterApi()    //原生调用flutter
abstract class NativeCallFlutterApi {
  @async
  String? getBagelToken();

  @async
  String getSopList();
}
