// Cores
import 'package:connectivity/connectivity.dart';

class ConnectionNetworkService {
  static final ConnectionNetworkService _singleton =
      ConnectionNetworkService._internal();

  factory ConnectionNetworkService() {
    return _singleton;
  }

  ConnectionNetworkService._internal();

  final connectivity = Connectivity();

  Future<bool> isConnectNetwork() async =>
      await connectivity.checkConnectivity() != ConnectivityResult.none;
}
