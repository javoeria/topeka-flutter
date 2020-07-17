import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:topeka/constants.dart';
import 'package:topeka/models/user.dart';
import 'package:topeka/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs));
}

class MyApp extends StatelessWidget {
  MyApp(this.prefs);

  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserData(prefs),
      child: MaterialApp(
        title: 'Topeka',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: prefs.getKeys().isEmpty
            ? SignScreen()
            : HomeScreen(
                name: prefs.getString('name'),
                avatar: prefs.getInt('avatar'),
              ),
      ),
    );
  }
}

class SignScreen extends StatefulWidget {
  @override
  _SignScreenState createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  String name = '';
  String initial = '';
  int avatar;

  bool get _isReady {
    return name.isNotEmpty && initial.isNotEmpty && avatar != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            Text(
              'Sign In',
              style: Theme.of(context).textTheme.headline6.copyWith(color: kBasePrimaryColor),
            ),
            SizedBox(height: 8.0),
            TextField(
              key: Key('name'),
              decoration: InputDecoration(labelText: 'First Name', alignLabelWithHint: true),
              textCapitalization: TextCapitalization.words,
              onChanged: (value) {
                setState(() => name = value);
              },
            ),
            TextField(
              key: Key('initial'),
              decoration: InputDecoration(
                  labelText: 'Last Initial', alignLabelWithHint: true, counterText: ''),
              textCapitalization: TextCapitalization.words,
              maxLength: 1,
              onChanged: (value) {
                setState(() => initial = value);
              },
            ),
            SizedBox(height: 80.0),
            Text(
              'Choose an Avatar',
              style: Theme.of(context).textTheme.headline6.copyWith(color: kBasePrimaryColor),
            ),
            SizedBox(height: 16.0),
            GridView.extent(
              maxCrossAxisExtent: 64.0,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(16, (index) {
                int i = index + 1;
                return GestureDetector(
                  key: Key('avatar_$i'),
                  child: Material(
                    shape: avatar == i
                        ? CircleBorder(side: BorderSide(color: kBasePrimaryColor, width: 4))
                        : null,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/avatars/avatar_${i}_raster.png'),
                    ),
                  ),
                  onTap: () {
                    setState(() => avatar = i);
                  },
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: _isReady
          ? FloatingActionButton(
              child: Icon(Icons.check, color: Colors.black),
              backgroundColor: kBasePrimaryColor,
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('name', name + ' ' + initial);
                prefs.setInt('avatar', avatar);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(
                      name: name + ' ' + initial,
                      avatar: avatar,
                    ),
                    settings: RouteSettings(name: 'HomeScreen'),
                  ),
                );
              },
            )
          : null,
    );
  }
}
