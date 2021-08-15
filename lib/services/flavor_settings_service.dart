// Cores
import 'package:flutter/services.dart';
// Utils
import 'package:flutter_bloc_boilerplate/utils/constants/flavor_settings.dart';

class FlavorSettingsService {
  static late FlavorSettings flavorSettings;

  static Future<void> setFlavorSettings() async {
    final flavor =
        await const MethodChannel('flavor').invokeMethod<String>('getFlavor');
    switch (flavor) {
      case 'development':
        flavorSettings = FlavorSettings.development();
        break;
      case 'staging':
        flavorSettings = FlavorSettings.staging();
        break;
      case 'production':
        flavorSettings = FlavorSettings.production();
        break;
      default:
        throw Exception('Unknown flavor: $flavor');
    }
  }

  static FlavorSettings getFlavorSettings() {
    return flavorSettings;
  }
}
