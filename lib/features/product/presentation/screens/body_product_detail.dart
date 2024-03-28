import 'package:fawry_app/features/product/presentation/controlles/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/components.dart';

class BodyProductDetails extends StatefulWidget {
  const BodyProductDetails({super.key});

  @override
  State<BodyProductDetails> createState() => _BodyProductDetailsState();
}

class _BodyProductDetailsState extends State<BodyProductDetails> {
  void initState() {
    // super.initState();
    ProductCubit.get(context).pageController.addListener(() {
      setState(() {
        ProductCubit.get(context).currentPage =
            ProductCubit.get(context).pageController.page!.round();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return ProductCard(item: ProductCubit.get(context).ProductData[index]);
      },
      // separatorBuilder: (BuildContext context, int index) {
      //   return const Divider(
      //     thickness: 0,
      //   );
      // },
    );
  }
}
