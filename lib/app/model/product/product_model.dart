class ProductItem {
  final String assetPath;
  final String title;
  final String price;
  final String oldPrice;
  final String discount;

  ProductItem({
    required this.assetPath,
    required this.title,
    required this.price,
    this.oldPrice = '',
    this.discount = '',
  });
}
