class RecommendedProductsSchema {
  RecommendedProductsSchema({required this.title});

  final String title;

  factory RecommendedProductsSchema.fromJson(Map<String, dynamic> json) {
    return RecommendedProductsSchema(title: json['title']);
  }
}
