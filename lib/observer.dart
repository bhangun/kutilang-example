import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io' show Platform;

import 'package:logging/logging.dart';

class KutBlocObserver extends BlocObserver {
final log = Logger('AuthenticationBloc');

checkPlatform(){
if (Platform.isAndroid) {
  // Android-specific code
} else if (Platform.isIOS) {
  // iOS-specific code
}
  /* Platform.isAndroid
  Platform.isFuchsia
  Platform.isIOS
  Platform.isLinux
  Platform.isMacOS
  Platform.isWindows */
}


  @override
  void onEvent(Bloc bloc, Object? event) {
    log.info(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log.info(transition);
    // Transition { currentState: ThemeData#e0c60, event: null, nextState: ThemeData#62398 }
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    log.info(error);
    super.onError(bloc, error, stackTrace);
  }
}