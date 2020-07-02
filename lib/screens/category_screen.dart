import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({
    @required this.imagePath,
    @required this.labelColor,
    @required this.labelText,
    @required this.backgroundColor,
    @required this.textColor,
    @required this.accentColor,
  });

  final String imagePath;
  final String labelText;
  final Color labelColor;
  final Color backgroundColor;
  final Color textColor;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          labelText,
          style: TextStyle(color: textColor),
        ),
        leading: BackButton(color: textColor),
        backgroundColor: labelColor,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Image.asset('images/quizzes/image_category_${imagePath}_raster.png'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow, color: Colors.black),
        backgroundColor: accentColor,
        onPressed: null,
      ),
    );
  }
}
