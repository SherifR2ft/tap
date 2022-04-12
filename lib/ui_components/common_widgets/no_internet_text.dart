import 'package:flutter/material.dart';
import 'package:tap_assignment_sherif/constant/constant_values.dart';
import 'package:tap_assignment_sherif/utils/localizations.dart';
import 'package:tap_assignment_sherif/utils/dimensions.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection(
      {Key? key,
      this.titleBarHasChild = false,
      this.isScroll = false,
      this.scrollPopupHeight})
      : super(key: key);
  final bool isScroll;
  final bool titleBarHasChild;
  final double? scrollPopupHeight;
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
                          3
                      //indicator
                      : AppSize.screenHeightOnly),
              width: AppSize.widthSize,
              child: const _NoInternetConnectionWidget(),
            ),
          )
        : const _NoInternetConnectionWidget();
  }
}

class _NoInternetConnectionWidget extends StatelessWidget {
  const _NoInternetConnectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Constants.horizontalPadding + 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            'assets/image/empty_states/no_conecation.png',
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            AppLocalization.myLocal.noInternet,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontSize: AppSize.primarySize - 2,
                ),
          ),
          Text(
            '${AppLocalization.myLocal.noInternetPara}\n${AppLocalization.myLocal.noInternetParb}',
            textAlign: TextAlign.center,
            maxLines: 2,
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontSize: AppSize.textFieldSize,
                ),
          ),
        ],
      ),
    );
  }
}
