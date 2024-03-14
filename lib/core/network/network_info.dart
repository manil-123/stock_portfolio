import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;

  Stream<ConnectionState> getStatus();
}

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  const NetworkInfoImpl(this.checker);

  final InternetConnectionChecker checker;

  @override
  Future<bool> get isConnected => checker.hasConnection;

  @override
  Stream<ConnectionState> getStatus() => checker.onStatusChange.map(
        (event) {
          if ((event == InternetConnectionStatus.connected)) {
            return ConnectionState.connected;
          } else {
            return ConnectionState.disconnected;
          }
        },
      );
}

enum ConnectionState { connected, disconnected }
