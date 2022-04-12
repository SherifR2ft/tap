import 'package:flutter/material.dart';
import 'package:tap_assignment_sherif/utils/dimensions.dart';

class SuffixIconText extends StatelessWidget {
  const SuffixIconText({
    Key? key,
    required this.suffixText,
  }) : super(key: key);

  final String? suffixText;

  @override
  Widget build(BuildContext context) {
    return Text(suffixText ?? '',
        maxLines: 1,
        style: Theme.of(context)
            .textTheme
            .caption
            ?.copyWith(fontSize: AppSize.textFieldSize));
  }
}
