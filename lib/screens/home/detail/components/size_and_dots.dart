import 'package:flutter/material.dart';
import 'package:shopping/constants.dart';
import 'package:shopping/models/product.dart';

import 'coloured_dots.dart';

class SizeAndColoredDot extends StatelessWidget {
  const SizeAndColoredDot({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Color"),
              Row(
                children: [
                  ColoredDot(
                    color: Color(0xff354c95),
                    isSelected: true,
                  ),
                  ColoredDot(
                    color: Color(0xfff8c878),
                  ),
                  ColoredDot(
                    color: Color(0xffa29898),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(style: TextStyle(color: kTextColor), children: [
              TextSpan(text: "Size\n"),
              TextSpan(
                text: "${product.size} cm",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontWeight: FontWeight.bold),
              )
            ]),
          ),
        )
      ],
    );
  }
}
