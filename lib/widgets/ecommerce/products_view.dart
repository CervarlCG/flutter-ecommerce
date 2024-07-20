import 'dart:math';

import 'package:ecommerce/models/entities/product.dart';
import 'package:ecommerce/models/theme/spacing.dart';
import 'package:ecommerce/widgets/common/tabs.dart';
import 'package:ecommerce/widgets/ecommerce/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class ProductsView extends StatefulWidget {
  const ProductsView(
      {required this.recommendedProductsList, required this.title, super.key});

  final ProductsByCategoryList recommendedProductsList;
  final String title;

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView>
    with TickerProviderStateMixin {
  late final ProductsByCategoryList recommendedProductsList;

  @override
  void initState() {
    super.initState();
    recommendedProductsList = widget.recommendedProductsList;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextStyle? titleStyle = theme.textTheme.titleMedium;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: Spacings.sm),
          child: Text(
            widget.title,
            style: titleStyle,
          ),
        ),
        TabsContainer(
            getTabView: (int index) {
              int columnCounter = 0;
              int rowCounter = 0;
              return LayoutGrid(
                columnSizes: [1.fr, 1.fr],
                rowSizes: const [auto, auto],
                columnGap: Spacings.normal,
                rowGap: Spacings.normal,
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
