import 'package:flutter/material.dart';
import 'package:nil/nil.dart';
import 'package:tap_assignment_sherif/constant/constant_values.dart';
import 'package:tap_assignment_sherif/ui_components/common_widgets/back_button.dart';
import 'package:tap_assignment_sherif/utils/dimensions.dart';

class PageHeaderTemplate extends PreferredSize {
  const PageHeaderTemplate({
    Key? key,
    required this.title,
    this.icon,
    this.hasBackButton = false,
    this.backButtonFunc,
  }) : super(preferredSize: const Size.square(1000), child: nil, key: key);

  final String title;
  final IconData? icon;
  final bool hasBackButton;
  final Function()? backButtonFunc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Constants.horizontalPadding,
          vertical: hasBackButton ? 23.5 : 25),
      margin: EdgeInsets.only(top: AppSize.topPaddingSize),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: hasBackButton
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          if (hasBackButton)
            BackButtonCustomize(backButtonFunc: backButtonFunc),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontSize: AppSize.subPrimarySize + 2),
          ),
          if (hasBackButton) const SizedBox(),
        ],
      ),
    );
  }
}
