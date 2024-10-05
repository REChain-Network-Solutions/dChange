import 'package:flutter/material.dart';

import '../../../utils/custom_color.dart';
import '../../../utils/dimensions.dart';
import 'transaction_tile_widget.dart';

class ExpendedItemWidget extends StatelessWidget {
  final String title;
  final String value;
  final bool visible;
  final String richText;
  final VoidCallback? onTap;
  final Color? valueColor;
  final bool textWrap;

  const ExpendedItemWidget({
    super.key,
    required this.title,
    required this.value,
    this.visible = true,
    this.richText = "",
    this.onTap,
    this.valueColor,
    this.textWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: Dimensions.marginBetweenInputTitleAndBox),
          child: TransactionItemTileWidget(
            onTap: onTap,
            richText2: richText,
            title: title,
            value: value,
            valueColor: valueColor,
            textWrap: textWrap,
          ),
        ),
        Visibility(visible: visible, child: _divider())
      ],
    );
  }

  Widget _divider() {
    return const Divider(
      color: CustomColor.primaryLightScaffoldBackgroundColor,
      height: 1.5,
      thickness: 1.5,
    );
  }
}
