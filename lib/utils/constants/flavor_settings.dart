// Enums
import 'package:flutter_bloc_boilerplate/utils/enums/type_flavor.dart';

class FlavorSettings {
  final String apiBaseUrl;
  final TypeFlavor typeFlavor;

  FlavorSettings.development()
      : typeFlavor = TypeFlavor.development,
        apiBaseUrl = 'https://dev.example.com';
  FlavorSettings.staging()
      : typeFlavor = TypeFlavor.staging,
        apiBaseUrl = 'https://stg.example.com';
  FlavorSettings.production()
      : typeFlavor = TypeFlavor.production,
        apiBaseUrl = 'https://prod.example.com';
}
