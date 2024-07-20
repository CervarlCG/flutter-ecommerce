import 'package:ecommerce/models/entities/product.dart';
import 'package:ecommerce/models/entities/store.dart';
import 'package:ecommerce/models/theme/spacing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Consumer<Store>(builder: (context, store, child) {
      return Card(
        key: Key(product.id),
        shadowColor: Colors.transparent,
        child: Padding(
            padding: EdgeInsets.only(
                top: Spacings.normal,
                left: Spacings.normal,
                right: Spacings.normal,
                bottom: Spacings.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Stack(clipBehavior: Clip.none, children: [
                    Container(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(Spacings.sm),
                      child: Image(
                        image: NetworkImage(product.image),
                      ),
                    )
                  ]),
                ),
                Padding(
                    padding: EdgeInsets.only(top: Spacings.sm),
                    child: Text(product.name,
                        style: TextStyle(color: theme.colorScheme.secondary))),
                Row(
                  children: [
                    Text(
                      store.money(product.price).toString(),
                      style: theme.textTheme.labelLarge,
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Center(child: Text("Test"))));
                        },
                        icon: const Icon(
                          Icons.shopping_cart,
                          size: Spacings.normal,
                        ))
                  ],
                )
              ],
            )),
      );
    });
  }
}
