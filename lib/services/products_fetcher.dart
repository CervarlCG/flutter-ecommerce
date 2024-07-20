import 'package:ecommerce/mock/products.dart';
import 'package:ecommerce/models/entities/product.dart';

class ProductsFetcher {
  Future<RecommendedProductsList> getRecommendedProducts() async {
    return [
      RecommendedProducts(
          category: categoryRoom,
          products: [product1, product2, product3, product4]),
      RecommendedProducts(
          category: categoryLivingRoom, products: [product5, product6]),
      RecommendedProducts(category: categoryKitchen, products: [])
    ];
  }
}
