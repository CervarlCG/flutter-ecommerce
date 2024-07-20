import 'package:ecommerce/models/schemas/sections/banner.dart';
import 'package:ecommerce/models/theme/spacing.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({required this.schema, super.key});
  final BannerSchema schema;

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned.fill(
                child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50)),
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(schema.backgroundImage),
              ),
            )),
            Center(
                child: Padding(
              padding: EdgeInsets.only(top: statusBarHeight, bottom: 66),
              child: Column(
                children: [
                  Text(
                    schema.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 64),
                  ),
                  Text(
                    schema.content,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Spacings.lg),
                  ElevatedButton(
                    child: Text(schema.cta.name),
                    onPressed: () {},
                  )
                ],
              ),
            ))
          ],
        ));
  }
}
