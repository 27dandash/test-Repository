import 'package:flutter/material.dart';

import '../screens/body_tap_view.dart';

class PropertyTapView extends StatelessWidget {
  const PropertyTapView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: BodyTapBar()));
  }
}
