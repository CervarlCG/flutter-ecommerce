import 'dart:math';

import 'package:ecommerce/models/entities/product.dart';
import 'package:ecommerce/models/theme/spacing.dart';
import 'package:ecommerce/widgets/common/tabs.dart';
import 'package:ecommerce/widgets/ecommerce/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class RecommendedProductsView extends StatefulWidget {
  const RecommendedProductsView(
      {required this.recommendedProductsList, super.key});

  final RecommendedProductsList recommendedProductsList;

  @override
  State<RecommendedProductsView> createState() =>
      _RecommendedProductsViewState();
}

class _RecommendedProductsViewState extends State<RecommendedProductsView>
    with TickerProviderStateMixin {
  late final RecommendedProductsList recommendedProductsList;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    recommendedProductsList = widget.recommendedProductsList;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextStyle? titleStyle = theme.textTheme.titleMedium;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recommended products",
          style: titleStyle,
        ),
        TabsContainer(
            getTabView: (int index) {
              int columnCounter = 0;
              int rowCounter = 0;
              return LayoutGrid(
                columnSizes: [1.fr, 1.fr],
                rowSizes: const [auto, auto],
                columnGap: spacing(1),
                rowGap: spacing(1),
                children: recommendedProductsList[index]
                    .products
                    .map((product) {
                      if (columnCounter >= 2) {
                        columnCounter = 0;
                        rowCounter++;
                      }
                      return ProductCard(
                        product: product,
                      ).withGridPlacement(
                          columnStart: (columnCounter++),
                          columnSpan: 1,
                          rowStart: rowCounter,
                          rowSpan: 1);
                    })
                    .toList()
                    .sublist(0,
                        min(4, recommendedProductsList[index].products.length)),
              );
            },
            tabs: recommendedProductsList.map((recommendedProduct) {
              return Tab(text: recommendedProduct.category.name);
            }).toList()),
      ],
    );
  }
}
