import 'package:flutter/material.dart';
import 'package:tap_assignment_sherif/constant/constant_values.dart';
import 'package:tap_assignment_sherif/utils/extension/nullable_extension.dart';
import 'package:tap_assignment_sherif/utils/dimensions.dart';

class EmptyState extends StatelessWidget {
  const EmptyState(
      {Key? key,
      this.image,
      this.scrollPopupHeight,
      this.baseText,
      this.subTextA,
      this.subTextB,
      this.titleBarHasChild = false,
      this.centerOnly = false})
      : super(key: key);
  final String? image;
  final double? scrollPopupHeight;
  final String? baseText;
  final String? subTextA;
  final String? subTextB;
  final bool titleBarHasChild;
  final bool centerOnly;
  @override
  Widget build(BuildContext context) {
    return centerOnly
        ? Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 40, horizontal: Constants.horizontalPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  image ?? 'assets/image/empty_states/empty_request.png',
                  height: AppSize.primarySize * 5.4,
                ),
                SizedBox(
                  height: 17.0,
                  width: AppSize.widthSize,
                ),
                Text(
                  baseText ?? '',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.overline?.copyWith(
                        fontSize: AppSize.titleFieldSize,
                      ),
                ),
              ],
            ),
          )
        : SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Constants.horizontalPadding),
              child: SizedBox(
                height: scrollPopupHeight ??
                    (titleBarHasChild
                        ? AppSize.screenHeightOnly -
                            46 // container
                            -
                            3 //indicator
                        : AppSize.screenHeightOnly),
                width: AppSize.widthSize,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(
                        image ?? 'assets/image/empty_states/empty_request.png',
                        height: AppSize.heightSize / 3.5,
                        width: AppSize.widthSize / 1.5),
                    Padding(
                      padding: const EdgeInsets.only(top: 43.0, bottom: 5),
                      child: Text(
                        baseText ?? '',
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.overline?.copyWith(
                              fontSize: AppSize.subPrimarySize - 3,
                            ),
                      ),
                    ),
                    if (subTextA.isNotEmptyOrNull())
                      Text(
                        '$subTextA\n${subTextB ?? ''}',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                              fontSize: AppSize.textFieldSize - 2,
                            ),
                      ),
                  ],
                ),
              ),
            ),
          );
  }
}
