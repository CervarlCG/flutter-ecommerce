import 'package:ecommerce/models/schemas/sections/banner.dart';
import 'package:ecommerce/models/schemas/sections/recommended_products.dart';

class HomeTemplate {
  HomeTemplate({required this.banner, required this.recommendedProducts});

  final BannerSchema banner;
  final RecommendedProductsSchema recommendedProducts;

  factory HomeTemplate.fromJson(Map<String, dynamic> json) {
    return HomeTemplate(
        banner: BannerSchema.fromJson(json['banner']),
        recommendedProducts:
            RecommendedProductsSchema.fromJson(json['recommendedProducts']));
  }
}
