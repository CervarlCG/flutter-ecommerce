import 'package:ecommerce/models/schemas/templates/home.dart';
import 'package:ecommerce/services/cms_fetcher.dart';
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

  @override
  void initState() {
    super.initState();
    template = CMS.fetch(templateName);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: template,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            HomeTemplate template = snapshot.data as HomeTemplate;
            return Column(
              children: [
                BannerWidget(
                  schema: template.banner,
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
