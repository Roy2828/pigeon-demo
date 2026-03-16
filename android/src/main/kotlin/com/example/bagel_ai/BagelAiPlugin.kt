package com.example.bagel_ai

import android.widget.Toast
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** BagelAiPlugin */
class BagelAiPlugin: FlutterPlugin, MethodCallHandler, FlutterCallNativeApi {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private var flutterPluginBinding: FlutterPlugin.FlutterPluginBinding?=null

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "bagel_ai")
    channel.setMethodCallHandler(this)
    this.flutterPluginBinding = flutterPluginBinding;
    FlutterCallNativeApi.setUp(flutterPluginBinding.binaryMessenger, this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  //方法实现
  override fun getAppInfo(): AppInfo {
    return AppInfo(isProductionEnv = true, jPushId = "ddd", projectName = "dsds")
  }

  override fun sensorAddTrack(
    eventName: String,
    paramsMap: Map<String, Any>,
    callback: (kotlin.Result<Unit>) -> Unit
  ) {

     }

  override fun sensorGetPresetProperty(propertyName: String): String {
    Toast.makeText(flutterPluginBinding?.applicationContext,propertyName+"",0).show()
      return "sssssddd"
  }
}
