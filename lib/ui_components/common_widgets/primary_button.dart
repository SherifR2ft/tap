import 'package:flutter/material.dart';
import 'package:tap_assignment_sherif/constant/constant_values.dart';
import 'package:tap_assignment_sherif/utils/extension/app_theme_mode.dart';
import 'package:tap_assignment_sherif/utils/dimensions.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.func,
    required this.title,
    this.disable = false,
  }) : super(key: key);

  final void Function()? func;
  final String title;
  final bool disable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        decoration: disable
            ? Constants.disableBoxDecoration
            : MediaQuery.of(context).platformBrightness.isLightMode()
                ? Constants.primaryBoxDecoration
                : Constants.primaryBoxDecorationDark,
        height: Constants.buttonHeight,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(title,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .button
                    ?.copyWith(fontSize: AppSize.subPrimarySize)),
          ),
        ),
      ),
    );
  }
}
