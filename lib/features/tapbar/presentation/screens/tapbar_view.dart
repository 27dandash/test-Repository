import 'package:fawry_app/core/network/local/SharedPreferences.dart';
import 'package:fawry_app/features/tapbar/presentation/screens/widgets/first_screen.dart';
import 'package:fawry_app/features/tapbar/presentation/screens/widgets/second_screen.dart';
import 'package:fawry_app/features/tapbar/presentation/screens/widgets/third_screen.dart';
import 'package:flutter/material.dart';

class tapbar_view extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Center(child: Text('املاكي')),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(AppBar().preferredSize.height),
              child: const SizedBox(
                height: 50,
                child: TabBar(
                  indicatorSize:TabBarIndicatorSize.tab ,
                  // selectedItemColor: Colors.blue, // Color of selected tab text
                  // unselectedItemColor: Colors.grey, // Color of unselected tab text
                  // selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold), // Style of selected tab text
                  // unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal), // Style of unselected tab text

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
          body: TabBarView(
            children: [const first(), third(), const second()],
          ),
        ),
      ),
    );
  }
}
