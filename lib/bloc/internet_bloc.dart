import 'package:bloc/bloc.dart';
import 'package:check_internet/bloc/internet_event.dart';
import 'package:check_internet/bloc/internet_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState>{
  final Connectivity _connectivity = Connectivity();
  ConnectionBloc() : super(ConnectionState(false)) {
    on<ConnectivityChanged>((event, emit) {
      emit(ConnectionState(event.isConnected));
    });

   _connectivity.onConnectivityChanged.listen((result) {
      bool isConnected = result != ConnectivityResult.none;
      add(ConnectivityChanged(isConnected));
    });
  }
}