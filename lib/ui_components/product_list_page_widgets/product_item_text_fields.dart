import 'package:flutter/material.dart';
import 'package:tap_assignment_sherif/utils/localizations.dart';
import 'package:tap_assignment_sherif/utils/dimensions.dart';
import 'package:tap_assignment_sherif/utils/extension/nullable_extension.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Text(title ?? "",
        maxLines: 1,
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
              fontSize: AppSize.subPrimarySize,
            ));
  }
}

class DescriptionText extends StatelessWidget {
  const DescriptionText({
    Key? key,
    required this.description,
  }) : super(key: key);

  final String? description;

  @override
  Widget build(BuildContext context) {
    return Text(description ?? '',
        maxLines: 1,
        style: Theme.of(context).textTheme.subtitle2?.copyWith(
              fontSize: AppSize.textFieldSize,
            ));
  }
}

class PriceText extends StatelessWidget {
  const PriceText({
    Key? key,
    required this.price,
  }) : super(key: key);

  final String? price;

  @override
  Widget build(BuildContext context) {
    return Text(
        "${price.isNotEmptyOrNull() ? price : '-'} ${AppLocalization.myLocal.kdUnit}",
        maxLines: 1,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
              fontSize: AppSize.titleFieldSize,
            ));
  }
}
