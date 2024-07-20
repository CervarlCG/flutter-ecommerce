import 'package:ecommerce/mock/products.dart';
import 'package:ecommerce/models/entities/product.dart';

class ProductsFetcher {
  Future<ProductsByCategoryList> getRecommendedProducts() async {
    return [
      ProductsByCategory(
          category: categoryRoom,
          products: [product1, product2, product3, product4]),
      ProductsByCategory(
          category: categoryLivingRoom, products: [product5, product6]),
      ProductsByCategory(category: categoryKitchen, products: [])
    ];
  }
}
