import 'package:fawry_app/features/tapbar/presentation/components/components.dart';
import 'package:fawry_app/features/tapbar/presentation/controlles/cubit.dart';
import 'package:flutter/material.dart';


// Home Screen
class first extends StatelessWidget {
  const first({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(
            child: card()));
  }
}
class card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: TapbarCubit.get(context).aqarData.length,
      itemBuilder: (BuildContext context, int index) {
        return CustomCard(item: TapbarCubit.get(context).aqarData[index]);
      },
    );
  }
}

// Setting Screen
