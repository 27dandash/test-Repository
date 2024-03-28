
import 'package:fawry_app/features/product/presentation/components/components.dart';
import 'package:fawry_app/features/product/presentation/controlles/cubit.dart';
import 'package:fawry_app/features/tapbar/presentation/controlles/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/components.dart';

class BodyTapBar extends StatelessWidget {
  const BodyTapBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: TapbarCubit.get(context).PropertyData.length,
      itemBuilder: (BuildContext context, int index) {
        return PropertyCard(item: TapbarCubit.get(context).PropertyData[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          thickness: 0,
        );
      },
    );
  }
}
