import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class ConnectionInfo {
  Future<bool> isConnected();
}

class ConnectionInfoImpl implements ConnectionInfo {
  final InternetConnectionChecker checker;

  ConnectionInfoImpl(this.checker);

  @override
  Future<bool> isConnected() async {
    return await checker.hasConnection;
  }
}

// class DeviceStatus {
//   static Future<bool> get hasInternet =>
//       InternetConnectionChecker().hasConnection;
// }
