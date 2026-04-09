# bagel_ai

A new Flutter project.




//生成代码
dart run pigeon --input pigeon/pigeon.dart




## Getting Started

使用 pigeon 实现 Flutter 与原生通信
说明
pigeon是一个代码生成工具，用于生成Flutter与Platforms之间通信的代码，相比手写MethodChannel，它更方便，它能支持复杂的数据类型，并保证类型安全。

可生成各平台的代码：

Android：Kotlin、Java
iOS：Swift、Objective-C
macOS：Swift、Objective-C
Windows：C++
Linux：GObject
使用步骤
添加依赖

flutter pub add dev:pigeon
或：


pubspec.yaml

dev_dependencies:
pigeon: ^22.5.0
定义通信接口
在pubspec.yaml的同级目录中，新建通信接口文件，它是一个Dart文件，文件名可任意取，比如pigeon_host_api.dart。

在此文件中，定义通信的接口，通信接口分2种情况：

Flutter调用原生
原生调用Flutter
皆可自动生成对应代码。

生成代码

dart run pigeon --input pigeon_host_api.dart
编写原生代码、通过Dart调用
编写原生代码，实现插件的功能，然后Dart调用。

具体步骤放在其它文章中讨论。

API
生成文件
配置生成文件的路径、文件名等：


@ConfigurePigeon(
PigeonOptions(
// Flutter
dartOut: 'lib/pigeon/host_api.g.dart',
dartOptions: DartOptions(),
dartPackageName: 'cute',

    // Android
    kotlinOut: 'android/src/main/kotlin/com/yuluyao/cute/Cute.g.kt',
    kotlinOptions: KotlinOptions(
      package: "com.yuluyao.cute",
    ),
    // javaOut: 'android/src/main/java/com/yuluyao/cute/Cute.g.java',
    // javaOptions: JavaOptions(package: "com.yuluyao.cute"),

    // iOS or macOS
    swiftOut: 'ios/Classes/Cute.g.swift',
    swiftOptions: SwiftOptions(),
    // objcHeaderOut: 'macos/Runner/cute.g.h',
    // objcSourceOut: 'macos/Runner/cute.g.m',
    // objcOptions: ObjcOptions(prefix: 'PGN'),

    // Windows
    // cppOptions: CppOptions(namespace: 'cute'),
    // cppHeaderOut: 'windows/runner/cute.g.h',
    // cppSourceOut: 'windows/runner/cute.g.cpp',

    // Linux
    // gobjectHeaderOut: 'linux/include/cute.g.h',
    // gobjectSourceOut: 'linix/cute.g.m',
    // gobjectOptions: GObjectOptions(),

    // copyrightHeader: 'pigeons/copyright.txt',
),
)
原生API
定义原生API，这些API由原生平台实现，供Flutter端调用。


@HostApi()
abstract class ExampleHostApi {
void getSystemVersion();
}
Flutter API
定义Flutter API，这些API由Flutter端实现，供原生平台调用。


@FlutterApi()
abstract class ExampleFlutterApi {
void getFlutterVersion();
}
ObjC与Swift参数名
指定Objective-C与Swift的外部参数名，如果不指定就是默认值了。


@HostApi()
abstract class ExampleHostApi {
@ObjCSelector('addNumber:toNumber:')
@SwiftFunction('add(_:to:)')
int add(int a, int b);
}
最后更新时间: 2026年3月25日

