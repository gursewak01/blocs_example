import 'package:bloc/bloc.dart';

//BlocObserver
// In Flutter, the BlocObserver is a class provided by the flutter_bloc package. 
// It allows you to observe all state changes and events in your Bloc architecture globally. 
// This is useful for debugging and logging purposes, 
// as it enables you to monitor the behavior of your Blocs throughout the entire application.

class MyBlocObserver extends BlocObserver {

  // onEvent purpose: This method is called whenever an event is added to any Bloc.
  // Use Case: You can use this to perform any action whenever an event is added.
  // Parameters:
  //   Bloc bloc: The Bloc instance to which the event is added.
  //   Object? event: The event that was added.
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('onEvent -- bloc: ${bloc.runtimeType}, event: $event');
  }

  // onTransition purpose: This method is called whenever a state transition occurs in any Bloc.
  // Use Case: You can use this to log state transitions or perform actions based on state changes.
  // Parameters:
  //   Bloc bloc: The Bloc instance in which the state transition occurred.
  //   Transition transition: The transition object containing the current state, event, and next state.
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('onTransition -- bloc: ${bloc.runtimeType}, transition: $transition');
  }

  // onError purpose: This method is called whenever an error is thrown in any Bloc or Cubit.
  // Use Case: You can use this to log errors or perform custom error handling.
  // Parameters:
  //   BlocBase bloc: The Bloc or Cubit instance in which the error was thrown.
  //   Object error: The error that was thrown.
  //   StackTrace stackTrace: The stack trace associated with the error.
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print('onError -- bloc: ${bloc.runtimeType}, error: $error');
  }
}