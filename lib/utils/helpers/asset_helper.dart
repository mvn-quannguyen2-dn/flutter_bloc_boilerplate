import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class AssetHelper {
  static Future<Map<String, dynamic>> loadJson(String path) async {
    final content = await rootBundle.loadString(path);
    return jsonDecode(content);
  }

  ///Singleton factory
  static final AssetHelper _instance = AssetHelper._internal();

  factory AssetHelper() {
    return _instance;
  }

  AssetHelper._internal();
}
