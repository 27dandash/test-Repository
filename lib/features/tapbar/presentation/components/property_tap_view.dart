import 'package:fawry_app/features/product/presentation/screens/body_product_detail.dart';
import 'package:fawry_app/features/tapbar/presentation/screens/body_tapbar.dart';
import 'package:flutter/material.dart';


class PropertyTapView extends StatelessWidget {
  const PropertyTapView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: BodyTapBar()));
  }
}
