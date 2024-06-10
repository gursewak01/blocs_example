abstract class ConnectionEvent{}

class ConnectivityChanged extends ConnectionEvent{
  final bool isConnected;
  ConnectivityChanged(this.isConnected);
}