import 'package:ecommerce/models/schemas/sections/banner.dart';

class HomeTemplate {
  HomeTemplate({required this.banner});

  final BannerSchema banner;

  factory HomeTemplate.fromJson(Map<String, dynamic> json) {
    return HomeTemplate(banner: BannerSchema.fromJson(json['banner']));
  }
}
