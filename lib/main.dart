import 'dart:async';

import 'package:energise/src/core/util/logger.dart';
import 'package:energise/src/features/app/app_runner.dart';

void main() {
  logger.runLogging(
    () {
      runZonedGuarded(
        () => AppRunner().initializeAndRun(),
        (error, stackTrace) {
          logger.logZoneError(error, stackTrace);
        },
      );
    },
    const LogOptions(),
  );
}
