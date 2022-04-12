import 'package:flutter/material.dart';
import 'package:tap_assignment_sherif/utils/extension/nullable_extension.dart';
import 'package:tap_assignment_sherif/utils/localizations.dart';
import 'package:tap_assignment_sherif/utils/dimensions.dart';

class DataRetrieveError extends StatelessWidget {
  const DataRetrieveError({
    Key? key,
    this.titleBarHasChild = false,
    this.isScroll = false,
    this.refreshFunction,
    this.scrollPopupHeight,
    this.message,
  }) : super(key: key);
  final bool isScroll;
  final double? scrollPopupHeight;
  final String? message;
  final Function()? refreshFunction;
  final bool titleBarHasChild;
  @override
  Widget build(BuildContext context) {
    return isScroll
        ? SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: SizedBox(
              /// for tab bar with child
              height: scrollPopupHeight ??
                  (titleBarHasChild
                      ? AppSize.screenHeightOnly -
                          46 // container
                          -
                          3 //indicator
                      : AppSize.screenHeightOnly),
              width: AppSize.widthSize,
              child: refreshFunction == null
                  ? const _DataRetrieveErrorWidget()
                  : _DataRetrieveErrorWidget(refreshFunction: refreshFunction),
            ),
          )
        : message.isNotEmptyOrNull()
            ? _DataRetrieveErrorWidget(
                message: message,
              )
            : const _DataRetrieveErrorWidget();
  }
}

class _DataRetrieveErrorWidget extends StatelessWidget {
  const _DataRetrieveErrorWidget({Key? key, this.message, this.refreshFunction})
      : super(key: key);
  final String? message;
  final Function()? refreshFunction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            'assets/image/empty_states/data_retrive_error.png',
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            AppLocalization.myLocal.dataRetrieveError,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontSize: AppSize.primarySize - 2,
                ),
          ),

          /// to Give priority to message to appear
          message.isNotEmptyOrNull()
              ? Text(
                  message!,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontSize: AppSize.titleFieldSize,
                      ),
                )
              : Text(
                  AppLocalization.myLocal.dataRetrieveErrorPar,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontSize: AppSize.textFieldSize,
                      ),
                ),
          if (refreshFunction != null) ...{
            const SizedBox(
              height: 28,
            ),
            InkWell(
                onTap: refreshFunction,
                child: Text(
                  AppLocalization.myLocal.retry,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: AppSize.subPrimarySize,
                      ),
                ))
          }
        ],
      ),
    );
  }
}
