import 'package:ecommerce/models/schemas/sections/cta.dart';

class BannerSchema {
  BannerSchema(
      {required this.title,
      required this.content,
      required this.cta,
      required this.backgroundImage});

  final String title;
  final String content;
  final String backgroundImage;
  final CTASchema cta;

  factory BannerSchema.fromJson(Map<String, dynamic> json) {
    return BannerSchema(
        title: json['title'],
        content: json['content'],
        backgroundImage: json['backgroundImage'],
        cta: CTASchema.fromJson(json['cta']));
  }
}
