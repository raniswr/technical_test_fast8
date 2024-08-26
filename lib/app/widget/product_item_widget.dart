import 'package:flutter/material.dart';
import 'package:technical_test_fast8/app/model/product/product_model.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductItem product;

  ProductItemWidget({required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          product.assetPath,
          height: 100,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 8),
        Text(
          product.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        Text(
          product.price,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        if (product.oldPrice.isNotEmpty) ...[
          Text(
            product.oldPrice,
            style: const TextStyle(
              decoration: TextDecoration.lineThrough,
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          if (product.discount.isNotEmpty)
            Text(
              product.discount,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
        ],
      ],
    );
  }
}
