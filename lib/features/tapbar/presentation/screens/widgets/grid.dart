import 'package:flutter/material.dart';



class ColorGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 4.0, // Spacing between columns
          mainAxisSpacing: 4.0, // Spacing between rows
        ),
        itemCount: 8, // Number of items in the grid
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: _getColor(index), // Get color based on index
            child: Center(
              child: Text(
                '$index',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }

  Color _getColor(int index) {
    // Generate color based on index
    switch (index % 3) {
      case 0:
        return Colors.blue;
      case 1:
        return Colors.green;
      case 2:
        return Colors.orange;
      default:
        return Colors.blue;
    }
  }
}
