import 'package:flutter/material.dart';

class HomeProductPriceText extends StatelessWidget {
  const HomeProductPriceText(
      {super.key,
      this.currencySign = '\$',
      required this.price,
      this.maxLiness = 1,
      this.isLarge = false,
      this.lineThrough = false});

  final String currencySign, price;
  final int maxLiness;
  final bool isLarge, lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(currencySign + price,
        maxLines: maxLiness,
        overflow: TextOverflow.ellipsis,
        style: isLarge
            ? Theme.of(context).textTheme.headlineMedium!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null)
            : Theme.of(context).textTheme.titleLarge!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null));
  }
}
