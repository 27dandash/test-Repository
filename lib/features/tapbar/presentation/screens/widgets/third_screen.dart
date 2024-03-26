
import 'package:fawry_app/features/tapbar/presentation/components/components.dart';
import 'package:fawry_app/features/tapbar/presentation/controlles/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class third extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              indicatorColor: Colors.blue,

              tabs:  [
                Tab(
                  text: 'عقود نشطه',
                ),
                Tab(
                  text: 'عقود منتهيه',
                ),
              ],
            ),

            Expanded(child: card()),

          ],
        ),
      ),
    );
  }
}

class card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: TapbarCubit.get(context).aqodData.length,
      itemBuilder: (BuildContext context, int index) {
        return CustomCards(item: TapbarCubit.get(context).aqodData[index]);
      },
    );
  }
}
