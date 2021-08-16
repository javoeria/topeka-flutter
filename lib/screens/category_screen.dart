import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:topeka/models/category.dart';
import 'package:topeka/screens/quiz_screen.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen(this.c);

  final Category c;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: c.backgroundColor,
      appBar: AppBar(
        title: Text(
          c.name,
          style: TextStyle(color: c.textColor),
          key: Key('category'),
        ),
        leading: BackButton(color: c.textColor),
        backgroundColor: c.primaryColor,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Image.asset('images/quizzes/image_category_${c.id}_raster.png'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow, color: Colors.black),
        backgroundColor: c.accentColor,
        onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => QuizScreen(
                category: c,
                avatar: prefs.getInt('avatar')!,
              ),
              settings: RouteSettings(name: 'QuizScreen'),
            ),
          );
        },
      ),
    );
  }
}
