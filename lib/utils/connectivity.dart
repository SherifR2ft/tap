import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';

import 'package:flutter/services.dart';

class ConnectivityService {
// Create our public controller
  final _connectivity = Connectivity();
  final connectionStatusController = StreamController<ConnectivityResult>();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  ConnectivityService() {
    // Subscribe to the connectivity Changed Steam
    initConnectivity();
    connectivitySubscription = _connectivity.onConnectivityChanged
        .listen(connectionStatusController.add);
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print('Couldn\'t check connectivity status $e');
      return;
    }
    connectionStatusController.add(result);
  }
}
