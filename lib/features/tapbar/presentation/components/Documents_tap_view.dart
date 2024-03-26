import 'package:fawry_app/features/tapbar/presentation/components/components.dart';
import 'package:fawry_app/features/tapbar/presentation/controlles/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DocumentsTapView extends StatelessWidget {
  const DocumentsTapView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            const TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.black,
              indicator: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.grey), // provides to left side
                  right: BorderSide(color: Colors.grey), // for right side
                ),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
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
    return ListView.separated(
        itemCount: TapbarCubit.get(context).ContractsData.length,
        itemBuilder: (BuildContext context, int index) {
          return ContractsCard(
              item: TapbarCubit.get(context).ContractsData[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        });
  }
}
