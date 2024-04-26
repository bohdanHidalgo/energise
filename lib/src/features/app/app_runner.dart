import 'package:energise/src/core/util/init.dart';
import 'package:energise/src/core/util/logger.dart';
import 'package:energise/src/features/app/widgets/app.dart';
import 'package:flutter/widgets.dart';

class AppRunner {
  Future<void> initializeAndRun() async {
    final binding = WidgetsFlutterBinding.ensureInitialized();

    // Preserve splash screen
    binding.deferFirstFrame();

    // Override logging
    FlutterError.onError = logger.logFlutterError;
    WidgetsBinding.instance.platformDispatcher.onError =
        logger.logPlatformDispatcherError;

    Future<void> initializeAndRun() async {
      try {
        final result = await const InitializationProcessor().initialize();
        runApp(
          App(
            result: result,
          ),
        );
      } catch (e, stackTrace) {
        logger.error('Initialization failed', error: e, stackTrace: stackTrace);
        // TODO: ADD FAIL RUN
        // In this place we can ran app with error if init process was finished with error;
        // runApp(
        //   Initialization Failed App,
        // );
      } finally {
        // Allow rendering
        binding.allowFirstFrame();
      }
    }

    // Run the app
    await initializeAndRun();
  }
}
