import 'package:flutter/material.dart';
import 'package:shared/ui/components/tile_product_category.dart';

class ProductCategorySection extends StatelessWidget {
  final Function(int) onTap;
  final int indexSelected;
  const ProductCategorySection(
      {super.key, required this.onTap, required this.indexSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          TileProductCategory(
            text: "All Product",
            onTap: () => onTap(0),
            isSelected: indexSelected == 0,
          ),
          TileProductCategory(
            text: "Layanan Kesehatan",
            onTap: () => onTap(1),
            isSelected: indexSelected == 1,
          ),
          TileProductCategory(
            text: "Alat Kesehatan",
            onTap: () => onTap(2),
            isSelected: indexSelected == 2,
          ),
          TileProductCategory(
            text: "Product Sample",
            onTap: () => onTap(3),
            isSelected: indexSelected == 3,
          ),
        ],
      ),
    );
  }
}
