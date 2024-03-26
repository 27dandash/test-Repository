import 'package:flutter/material.dart';

import '../screens/body_tap_view.dart';

// Home Screen
class ContractsTapView extends StatelessWidget {
  const ContractsTapView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: BodyTapBar()));
  }
}