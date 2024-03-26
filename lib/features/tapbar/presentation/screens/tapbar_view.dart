import 'package:fawry_app/features/tapbar/presentation/components/Documents_tap_view.dart';
import 'package:fawry_app/features/tapbar/presentation/components/contracts_tap_view.dart';
import 'package:fawry_app/features/tapbar/presentation/components/property_tap_view.dart';
import 'package:flutter/material.dart';

class TapBarView extends StatelessWidget {
  const TapBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Center(child: Text('املاكي')),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(AppBar().preferredSize.height),
              child: const SizedBox(
                height: 50,
                child: TabBar(
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.black,
                  indicator: BoxDecoration(
                    border: Border(
                      left: BorderSide(color: Colors.grey),
                      right: BorderSide(color: Colors.grey), // for right side
                    ),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Colors.blue,
                  dividerColor: Colors.grey,
                  dividerHeight: 0.9,
                  tabs: [
                    Tab(
                      text: 'العقارات',
                    ),
                    Tab(
                      text: 'العقود',
                    ),
                    Tab(
                      text: 'السندات',
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              PropertyTapView(),
              DocumentsTapView(),
              ContractsTapView()
            ],
          ),
        ),
      ),
    );
  }
}
