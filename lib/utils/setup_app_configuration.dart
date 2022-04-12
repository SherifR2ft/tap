import 'package:tap_assignment_sherif/utils/dimensions.dart';

class AppConfiguration {
  static bool _hasSetup = false;

  /// need to be added at any {initialRoute}
  static setupAppConfiguration(context, {bool forceSetup = false}) {
    // to break if configuration has been setup before
    if (_hasSetup && !forceSetup) return;
    _hasSetup = true;
    AppSize.setDefaultSize(context);
  }
}
