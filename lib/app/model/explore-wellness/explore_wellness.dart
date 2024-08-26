class ExploreWellness {
  final int? id;
  final String name;
  final String price;
  final String imageAssetPath;

  ExploreWellness({this.id, required this.name, required this.price, required this.imageAssetPath});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'imageAssetPath': imageAssetPath,
    };
  }

  factory ExploreWellness.fromMap(Map<String, dynamic> map) {
    return ExploreWellness(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      imageAssetPath: map['imageAssetPath'],
    );
  }
}
