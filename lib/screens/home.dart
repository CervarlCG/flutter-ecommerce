import 'package:ecommerce/models/entities/product.dart';
import 'package:ecommerce/models/schemas/templates/home.dart';
import 'package:ecommerce/models/theme/spacing.dart';
import 'package:ecommerce/services/cms_fetcher.dart';
import 'package:ecommerce/services/products_fetcher.dart';
import 'package:ecommerce/widgets/common/tabs.dart';
import 'package:ecommerce/widgets/ecommerce/recommended_products.dart';
import 'package:flutter/material.dart';
import '../widgets/common/banner.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  final String templateName = "home";
  late Future<HomeTemplate> template;
  late Future<RecommendedProductsList> recommendedProducts;

  @override
  void initState() {
    super.initState();
    ProductsFetcher productsFetcher = ProductsFetcher();
    template = CMS.fetch(templateName);
    recommendedProducts = productsFetcher.getRecommendedProducts();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? titleStyle = Theme.of(context).textTheme.titleMedium;
    return FutureBuilder(
        future: Future.wait([template, recommendedProducts]),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            HomeTemplate template = snapshot.data![0] as HomeTemplate;
            RecommendedProductsList recommendedProducts =
                snapshot.data![1] as RecommendedProductsList;
            return ListView(
              children: [
                BannerWidget(
                  schema: template.banner,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: spacing(1), right: spacing(1), top: spacing(2)),
                  child: RecommendedProductsView(
                      recommendedProductsList: recommendedProducts),
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        });
  }
}
