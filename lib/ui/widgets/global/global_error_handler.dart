import 'dart:async';

import 'package:fltrello/core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GlobalErrorHandler with AppLogger{
  GlobalErrorHandler({required Widget child}){

    // remove gray screen on release mode error
    if(kReleaseMode){ErrorWidget.builder = (_) => const SizedBox();}

    // handle flutter errors
    FlutterError.onError = _handleFlutterError;

    runZonedGuarded(() {

      // add before firebase or other third parties
      WidgetsFlutterBinding.ensureInitialized();

      runApp(child);
    }, (error, stack) {
      // handle native errors
      log.severe(error);
    });
  }

  void _handleFlutterError(FlutterErrorDetails details) {
    // handle flutter errors

    log.severe('Flutter error occurred');
    if(kReleaseMode){
      Zone.current.handleUncaughtError(details.exception, details.stack!);
    }else{
      FlutterError.dumpErrorToConsole(details);
    }
  }
}