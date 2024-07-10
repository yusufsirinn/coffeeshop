import 'package:coffeeshop/models/coffee.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Coffee -', () {
    test('fromJson should correctly parse JSON', () {
      Map<String, dynamic> jsonData = {
        'title': 'Espresso',
        'description': 'Strong coffee made by forcing steam through ground coffee beans.',
        'ingredients': ['coffee beans', 'water'],
        'image': 'assets/images/espresso.jpg',
        'id': 1,
        'price': 3,
      };

      Coffee coffee = Coffee().fromJson(jsonData);

      expect(coffee.title, 'Espresso');
      expect(coffee.description, 'Strong coffee made by forcing steam through ground coffee beans.');
      expect(coffee.ingredients, ['coffee beans', 'water']);
      expect(coffee.image, 'assets/images/espresso.jpg');
      expect(coffee.id, 1);
      expect(coffee.price, 3);
    });
  });
}
