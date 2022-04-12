import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:tap_assignment_sherif/constant/constant_values.dart';
import 'package:tap_assignment_sherif/main.dart';
import 'package:tap_assignment_sherif/network_layers/product/product_request.dart';
import 'package:tap_assignment_sherif/utils/firebase_configuration.dart';
import 'package:tap_assignment_sherif/utils/show_bottom_sheet.dart';

class AddProductProvider extends ChangeNotifier {
  bool _isLoading = false;
  get isLoading => _isLoading;

  void activeLoading([bool notifyListener = true]) {
    _isLoading = true;
    if (notifyListener) notifyListeners();
    // auto disable after timeout
    Future.delayed(Duration(seconds: Constants.timeOut.inSeconds + 1), () {
      if (_isLoading) {
        deactivateLoading(notifyListener);
      }
    });
  }

  void deactivateLoading([bool notifyListener = true]) {
    _isLoading = false;
    if (notifyListener) notifyListeners();

    /// for remove any snack bar
    ScaffoldMessenger.of(navigatorKey.currentState!.overlay!.context)
        .clearSnackBars();
  }

  void _onError(error, stackTrace) async {
    print('Exception details:\n $error');
    print('Stack trace:\n $stackTrace');
    deactivateLoading();
    await StatusBottomSheet.showDataRetrieveErrorBottomSheet(
        navigatorKey.currentState!.overlay!.context);
  }

  Future<void> _makeRequestAddProduct(
      {required ConnectivityResult? connectionStatus,
      required String name,
      required String description,
      required String price}) async {
    if (connectionStatus == ConnectivityResult.none) {
      await StatusBottomSheet.showNoInternetBottomSheet(
          navigatorKey.currentState!.overlay!.context);
      return;
    }
    activeLoading();

    final releaseRequestsRequest = AddProductRequest(
        name: name,
        desc: description,
        price: price,
        createdAt: DateTime.now().millisecondsSinceEpoch.toString());
    try {
      await AppFirebase.firebaseStreamData
          .push()
          .set(releaseRequestsRequest.toJson())
          .timeout(Constants.timeOut)
          .onError(_onError)
          .whenComplete(() {
        deactivateLoading(false);
        Navigator.pop(navigatorKey.currentState!.overlay!.context, true);
      });
    } catch (e, s) {
      _onError(e, s);
    }
  }

  Future<void> addProduct(
          {required ConnectivityResult? connectionStatus,
          required String name,
          required String description,
          required String price}) =>
      _makeRequestAddProduct(
          connectionStatus: connectionStatus,
          price: price,
          name: name,
          description: description);
}
