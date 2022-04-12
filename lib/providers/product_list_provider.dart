import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:tap_assignment_sherif/constant/constant_values.dart';
import 'package:tap_assignment_sherif/network_layers/network_base/network_mappers.dart';
import 'package:tap_assignment_sherif/network_layers/product/product_list_base.dart';
import 'package:tap_assignment_sherif/network_layers/product/product_list_response.dart';
import 'package:tap_assignment_sherif/utils/firebase_configuration.dart';
import 'package:tap_assignment_sherif/utils/extension/nullable_extension.dart';
import 'package:tap_assignment_sherif/utils/extension/generic_search.dart';

class ProductListProvider extends ChangeNotifier {
  late Future<List<ProductItemData>?> _dataProductRequests;

  List<ProductItemData> _dataProductSearchingList = [];

  bool _refreshSpinner = false;

  bool get refreshSpinner => _refreshSpinner;

  List<ProductItemData> get dataProductSearchingList =>
      _dataProductSearchingList;

  bool get dataProductSearchingListIsNotEmpty =>
      _dataProductSearchingList.isNotEmpty;

  Future<List<ProductItemData>?> get dataProductRequests =>
      _dataProductRequests;

  void initDataProductRequests({
    required ConnectivityResult? connectionStatus,
  }) {
    _dataProductRequests =
        _makeRequestProducts(connectionStatus: connectionStatus);
  }

  Future<List<ProductItemData>?> _makeRequestProducts({
    required ConnectivityResult? connectionStatus,
  }) async {
    if (connectionStatus == ConnectivityResult.none) {
      return Future.value(null);
    }

    var serverResponse;

    try {
      await AppFirebase.firebaseStreamData
          .once()
          .timeout(Constants.timeOut)
          .then((DatabaseEvent snapshot) {
        if (snapshot.snapshot.value == null) {
          serverResponse = EmptyMappable();
        } else {
          serverResponse = Mappable(
              ProductsListResponse(),
              json.encode((snapshot.snapshot.value as Map<dynamic, dynamic>)
                  .values
                  .toList()));
        }
      });
    } catch (e, s) {
      print('Exception details:\n $e');
      print('Stack trace:\n $s');
      return null;
    }
    if (serverResponse is ProductsListResponse) {
      _dataProductSearchingList = serverResponse.products?.productsList;
      if (_dataProductSearchingList.isNotEmpty) {
        // sorting data by Timestamp {createdAt}
        _dataProductSearchingList
            .sort((a, b) => b.createdAt.compareTo(a.createdAt));
      }
      return _dataProductSearchingList;
    } else if (serverResponse is EmptyMappable) {
      _dataProductSearchingList = [];
      return [];
    } else {
      _dataProductSearchingList = [];
      return null;
    }
  }

  Future<List<ProductItemData>?> _searchOnProducts(
      {required ConnectivityResult? connectionStatus,
      required String searchKeyWord}) async {
    if (connectionStatus == ConnectivityResult.none) {
      return Future.value(null);
    }
    if (!searchKeyWord.isNotEmptyOrNull()) {
      return _dataProductSearchingList;
    }
    try {
      /// locale searching product name, description and price,
      /// [_dataProductSearchingList] cause there no padding and all data are fetched once.
      return _dataProductSearchingList
          .where((productData) =>
              productData.productData.toJson().genericSearch(searchKeyWord))
          .toList();
    } catch (e, s) {
      print('Exception details:\n $e');
      print('Stack trace:\n $s');
      return null;
    }
  }

  Future<void> handlePullToRefresh({
    required ConnectivityResult? connectionStatus,
  }) async {
    final completer = Completer<void>();
    _dataProductRequests =
        _makeRequestProducts(connectionStatus: connectionStatus)
            .whenComplete(() {
      completer.complete();
      notifyListeners();
    });
    return completer.future;
  }

  Future<void> refreshFunction({
    required ConnectivityResult? connectionStatus,
  }) async {
    _refreshSpinner = true;
    notifyListeners();
    _dataProductRequests =
        _makeRequestProducts(connectionStatus: connectionStatus)
            .whenComplete(() {
      _refreshSpinner = false;
      notifyListeners();
    });
  }

  Future<void> onSearching(
      {required ConnectivityResult? connectionStatus,
      required String searchKeyWord}) async {
    if (connectionStatus == ConnectivityResult.none ||
        _dataProductSearchingList.isEmpty) return;
    _refreshSpinner = true;
    notifyListeners();
    _dataProductRequests = _searchOnProducts(
            searchKeyWord: searchKeyWord, connectionStatus: connectionStatus)
        .whenComplete(() {
      _refreshSpinner = false;
      notifyListeners();
    });
  }
}
