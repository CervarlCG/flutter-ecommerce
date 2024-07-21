import 'package:ecommerce/models/entities/product.dart';
import 'package:ecommerce/models/schemas/templates/home.dart';
import 'package:ecommerce/models/theme/spacing.dart';
import 'package:ecommerce/services/cms_fetcher.dart';
import 'package:ecommerce/services/products_fetcher.dart';
import 'package:ecommerce/widgets/ecommerce/products_view.dart';
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
  late Future<ProductsByCategoryList> recommendedProducts;

  @override
  void initState() {
    super.initState();
    ProductsFetcher productsFetcher = ProductsFetcher();
    template = CMS.fetch(templateName);
    recommendedProducts = productsFetcher.getRecommendedProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.wait([template, recommendedProducts]),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            HomeTemplate template = snapshot.data![0] as HomeTemplate;
            ProductsByCategoryList recommendedProducts =
                snapshot.data![1] as ProductsByCategoryList;
            return ListView(
              children: [
                BannerWidget(
                  schema: template.banner,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: Spacings.normal,
                      right: Spacings.normal,
                      top: Spacings.lg),
                  child: ProductsView(
                    recommendedProductsList: recommendedProducts,
                    title: template.recommendedProducts.title,
                  ),
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
