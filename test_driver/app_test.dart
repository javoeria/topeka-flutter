import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Topeka App', () {
    final titleTextFinder = find.byValueKey('title');
    final scoreTextFinder = find.byValueKey('score');
    final categoryTextFinder = find.byValueKey('category');
    final buttonFinder = find.byType('FloatingActionButton');

    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      driver.close();
    });

    test('sign in', () async {
      await driver.tap(find.byValueKey('name'));
      await driver.enterText('A');
      await driver.tap(find.byValueKey('initial'));
      await driver.enterText('A');
      await driver.tap(find.byValueKey('avatar_1'));
      await driver.tap(buttonFinder);
    });

    test('start category', () async {
      expect(await driver.getText(titleTextFinder), 'A A');
      expect(await driver.getText(scoreTextFinder), '0 pts');
      await driver.tap(find.byValueKey('category_food'));
      expect(await driver.getText(categoryTextFinder), 'Food & Drink');
      await driver.tap(buttonFinder);
      await driver.tap(find.pageBack());
      await driver.tap(find.byValueKey('menu'));
      await driver.tap(find.text('Sign out'));
    });
  });
}
