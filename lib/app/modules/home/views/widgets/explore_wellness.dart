import 'package:flutter/material.dart';
import 'package:technical_test_fast8/app/constant/colors.dart';
import 'package:technical_test_fast8/app/widget/product_item_widget.dart';
import 'package:technical_test_fast8/app/model/product/product_model.dart';

class ProductListSection extends StatelessWidget {
  final List<ProductItem> products;

  ProductListSection({required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Explore Wellness',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.grayMedium,
                borderRadius: BorderRadius.circular(25),
              ),
              child: DropdownButton<String>(
                value: 'Terpopuler',
                items: <String>['Terpopuler', 'Terbaru'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.2,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductItemWidget(product: products[index]);
          },
        ),
      ],
    );
  }
}
