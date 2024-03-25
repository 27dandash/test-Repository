import 'package:flutter/material.dart';

import 'grid.dart';



class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IconScreen(),
    );
  }
}

class IconScreen extends StatefulWidget {
  @override
  _IconScreenState createState() => _IconScreenState();
}

class _IconScreenState extends State<IconScreen> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _isPressed ?
           Column(
             children: [
               ColorGrid(),
               // Spacer(),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Center(
                     child: TextButton(
                       onPressed: () {
                         setState(() {
                           _isPressed = !_isPressed; // Toggle the state on press
                         });
                       },
                       child: _isPressed
                           ? Icon(Icons.favorite) // Display different icon when pressed
                           : Icon(Icons.favorite_border),
                     ),
                   ),
                 ],
               ),
             ],
           ):Column(children: [SizedBox(height: 20)],),

            const SizedBox(height: 20),
            _isPressed
                ? const Expanded(
              child: Center(
                child: Text(
                  'You liked it!',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}
