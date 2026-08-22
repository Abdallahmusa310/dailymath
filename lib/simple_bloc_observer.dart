import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('change = $change');
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('close = $bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('create = $bloc');
  }

  @override
  void onError(
    BlocBase bloc,
    Object error,
    StackTrace stackTrace,
  ) {
    debugPrint('error = $error');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint('event = $event');
  }

  @override
  void onTransition(
    Bloc bloc,
    Transition transition,
  ) {
    debugPrint('transition = $transition');
  }

  @override
  void onDone(
    Bloc bloc,
    Object? event, [
    Object? result,
    StackTrace? stackTrace,
  ]) {
    debugPrint('done = $event');
  }
}
