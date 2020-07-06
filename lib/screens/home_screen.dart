import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:topeka/constants.dart';
import 'package:topeka/main.dart';
import 'package:topeka/models/category.dart';
import 'package:topeka/screens/category_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({@required this.name, @required this.avatar, @required this.points});

  final String name;
  final int avatar;
  final int points;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF424242),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('images/avatars/avatar_${avatar}_raster.png'),
              ),
              SizedBox(width: 16.0),
              Text(name, key: Key('title')),
              Spacer(),
              Text('$points pts', key: Key('score')),
            ],
          ),
        ),
        titleSpacing: 0.0,
        backgroundColor: kBasePrimaryColor,
        actions: <Widget>[
          PopupMenuButton(
            key: Key('menu'),
            onSelected: (value) async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => SignScreen()),
                (Route<dynamic> route) => false,
              );
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(child: Text('Sign out'), value: 'out'),
              ];
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.only(left: 4.0, top: 4.0),
        childAspectRatio: 7 / 8,
        children: Category.sampleData().map((c) {
          return CategoryItem(c);
        }).toList(),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  CategoryItem(this.c);

  final Category c;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0, bottom: 4.0),
      child: InkWell(
        key: Key('category_${c.id}'),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: c.backgroundColor,
                  child: Image.asset('images/categories/icon_category_${c.id}_raster.png'),
                ),
              ),
              Container(
                color: c.primaryColor,
                child: Text(
                  c.name,
                  style: TextStyle(color: c.textColor),
                ),
                padding: const EdgeInsets.all(16.0),
              ),
            ],
          ),
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(c),
            settings: RouteSettings(name: 'CategoryScreen'),
          ),
        ),
      ),
    );
  }
}
