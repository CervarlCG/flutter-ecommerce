typedef RecommendedProductsList = List<RecommendedProducts>;

class Product {
  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.image,
      required this.price,
      required this.category});

  final String id;
  final String name;
  final String description;
  final String image;
  final int price;
  final ProductCategory category;
}

class ProductCategory {
  ProductCategory({required this.id, required this.name});

  final String id;
  final String name;
}

class RecommendedProducts {
  RecommendedProducts({required this.category, required this.products});

  final ProductCategory category;
  final List<Product> products;
}
