import 'dart:io';
import 'package:vexana/vexana.dart';

class NetworkConfig {
  late String baseUrl;

  late BaseOptions options;

  NetworkConfig() {
    if (Platform.isAndroid) {
      baseUrl = 'https://fakestoreapi.com';
    } else {
      baseUrl = 'https://fakestoreapi.com';
    }
    options = BaseOptions(baseUrl: baseUrl);
  }
}
