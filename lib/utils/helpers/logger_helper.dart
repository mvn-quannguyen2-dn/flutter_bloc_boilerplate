// Cores
import 'dart:developer' as developer;
// Services
import 'package:flutter_bloc_boilerplate/services/flavor_settings_service.dart';
// Utils
import 'package:flutter_bloc_boilerplate/utils/enums/type_flavor.dart';

class LoggerHelper {
  static const String tagDefault = 'FLUTTER_BLOC_BOILERPLATE';

  static void log([String tag = tagDefault, dynamic msg]) {
    if (FlavorSettingsService.flavorSettings.typeFlavor ==
        TypeFlavor.development) {
      developer.log('$msg', name: tag);
    }
  }

  static final LoggerHelper _instance = LoggerHelper._internal();

  factory LoggerHelper() {
    return _instance;
  }

  LoggerHelper._internal();
}
