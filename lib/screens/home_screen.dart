import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:topeka/constants.dart';
import 'package:topeka/main.dart';
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
              Text(name),
              Spacer(),
              Text('$points pts'),
            ],
          ),
        ),
        titleSpacing: 0.0,
        backgroundColor: kBasePrimaryColor,
        actions: <Widget>[
          PopupMenuButton(
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
        children: <Widget>[
          CategoryItem(
            imagePath: 'food',
            labelText: 'Food & Drink',
            labelColor: kGreenPrimaryColor,
            backgroundColor: kGreenBackgroundColor,
            textColor: kGreenTextColor,
            accentColor: kGreenAccentColor,
          ),
          CategoryItem(
            imagePath: 'knowledge',
            labelText: 'General Knowledge',
            labelColor: kYellowPrimaryColor,
            backgroundColor: kYellowBackgroundColor,
            textColor: kYellowTextColor,
            accentColor: kYellowAccentColor,
          ),
          CategoryItem(
            imagePath: 'history',
            labelText: 'History',
            labelColor: kBluePrimaryColor,
            backgroundColor: kBlueBackgroundColor,
            textColor: kBlueTextColor,
            accentColor: kBlueAccentColor,
          ),
          CategoryItem(
            imagePath: 'geography',
            labelText: 'Geography',
            labelColor: kRedPrimaryColor,
            backgroundColor: kRedBackgroundColor,
            textColor: kRedTextColor,
            accentColor: kRedAccentColor,
          ),
          CategoryItem(
            imagePath: 'science',
            labelText: 'Science and Nature',
            labelColor: kGreenPrimaryColor,
            backgroundColor: kGreenBackgroundColor,
            textColor: kGreenTextColor,
            accentColor: kGreenAccentColor,
          ),
          CategoryItem(
            imagePath: 'tvmovies',
            labelText: 'TV & Movies',
            labelColor: kPurplePrimaryColor,
            backgroundColor: kPurpleBackgroundColor,
            textColor: kPurpleTextColor,
            accentColor: kPurpleAccentColor,
          ),
          CategoryItem(
            imagePath: 'music',
            labelText: 'Music',
            labelColor: kBluePrimaryColor,
            backgroundColor: kBlueBackgroundColor,
            textColor: kBlueTextColor,
            accentColor: kBlueAccentColor,
          ),
          CategoryItem(
            imagePath: 'entertainment',
            labelText: 'Entertainment',
            labelColor: kRedPrimaryColor,
            backgroundColor: kRedBackgroundColor,
            textColor: kRedTextColor,
            accentColor: kRedAccentColor,
          ),
          CategoryItem(
            imagePath: 'sports',
            labelText: 'Sports',
            labelColor: kPurplePrimaryColor,
            backgroundColor: kPurpleBackgroundColor,
            textColor: kPurpleTextColor,
            accentColor: kPurpleAccentColor,
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  CategoryItem({
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
    return Padding(
      padding: const EdgeInsets.only(right: 4.0, bottom: 4.0),
      child: InkWell(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: backgroundColor,
                  child: Image.asset('images/categories/icon_category_${imagePath}_raster.png'),
                ),
              ),
              Container(
                color: labelColor,
                child: Text(
                  labelText,
                  style: TextStyle(color: textColor),
                ),
                padding: const EdgeInsets.all(16.0),
              ),
            ],
          ),
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(
              imagePath: imagePath,
              labelText: labelText,
              labelColor: labelColor,
              backgroundColor: backgroundColor,
              textColor: textColor,
              accentColor: accentColor,
            ),
            settings: RouteSettings(name: 'CategoryScreen'),
          ),
        ),
      ),
    );
  }
}
