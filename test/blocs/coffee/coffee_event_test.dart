import 'package:coffeeshop/blocs/coffee_bloc/coffee_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CoffeeEvent', () {
    test('CoffeeListFetch is instantiated correctly', () {
      const event = CoffeeListFetch();
      expect(event, isA<CoffeeListFetch>());
    });

    test('CoffeeDetail is instantiated correctly with index', () {
      const index = 1;
      const event = CoffeeDetail(index);
      expect(event, isA<CoffeeDetail>());
      expect(event.index, index);
    });

    test('CoffeeCategory is instantiated correctly with index', () {
      const index = 2;
      const event = CoffeeCategory(index);
      expect(event, isA<CoffeeCategory>());
      expect(event.index, index);
    });

    test('CoffeeSearch is instantiated correctly with keyword', () {
      const keyword = 'espresso';
      const event = CoffeeSearch(keyword);
      expect(event, isA<CoffeeSearch>());
      expect(event.keyword, keyword);
    });

    test('CoffeeSearch is instantiated correctly with null keyword', () {
      const event = CoffeeSearch(null);
      expect(event, isA<CoffeeSearch>());
      expect(event.keyword, isNull);
    });
  });
}
