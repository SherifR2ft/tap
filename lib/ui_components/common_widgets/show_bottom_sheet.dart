// import 'package:flutter/material.dart';
// import 'package:sigma/constant/constant_values.dart';
// import 'package:sigma/constant/size.dart';
// import 'package:sigma/pop_up/data_retrieve_error_pop_up.dart';
// import 'package:sigma/pop_up/no_internet_pop_up.dart';
// import 'package:sigma/extension/nullable_extension.dart';
//
// class ShowStatusBottomSheet {
//   /// fixed
//   static Future<void> showNoInternetBottomSheet(context) async {
//     await showModalBottomSheet(
//       backgroundColor: Colors.transparent,
//       context: context,
//       enableDrag: true,
//       isDismissible: true,
//       useRootNavigator: true,
//       isScrollControlled: true,
//       builder: (context) => const NoInternetPopUp(),
//     );
//   }
//
//   /// fixed
//   static Future<void> showDataRetrieveErrorBottomSheet(context,
//       {String? message}) async {
//     await showModalBottomSheet(
//       backgroundColor: Colors.transparent,
//       context: context,
//       enableDrag: true,
//       isDismissible: true,
//       useRootNavigator: true,
//       isScrollControlled: true,
//       builder: (context) => message.isNotEmptyOrNull()
//           ? DataRetrieveErrorPopUp(
//               message: message,
//             )
//           : const DataRetrieveErrorPopUp(),
//     );
//   }
//
//   /*
//   /// different from [showDataRetrieveErrorBottomSheet] that
//   /// [showDataRetrieveErrorSnackBar] is auto disappear
//   /// and has no elevation
//   static void showDataRetrieveErrorSnackBar(context, {String? message}) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       padding: EdgeInsets.all(0.0),
//       content: Column(
//         children: [
//           const Spacer(),
//           message.isNotEmptyOrNull()
//               ? DataRetrieveErrorPopUp(
//                   message: message,
//                   fromSnackBar: true,
//                 )
//               : const DataRetrieveErrorPopUp(
//                   fromSnackBar: true,
//                 ),
//         ],
//       ),
//     ));
//   }
//    */
// }
