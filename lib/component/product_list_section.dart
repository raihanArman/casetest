import 'package:flutter/material.dart';
import 'package:shared/ui/components/card_product.dart';

class ProductListSection extends StatelessWidget {
  const ProductListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CardProduct(),
          CardProduct(),
          CardProduct(),
        ],
      ),
    );
  }
}
