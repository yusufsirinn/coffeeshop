import 'package:coffeeshop/blocs/coffee_bloc/coffee_bloc.dart';
import 'package:coffeeshop/core/core.dart';
import 'package:coffeeshop/models/coffee.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CoffeeState', () {
    final coffee1 = Coffee(title: 'Espresso');
    final coffee2 = Coffee(title: 'Latte');
    final coffee3 = Coffee(title: 'Cappuccino');
    final coffee4 = Coffee(title: 'Caramel Latte');
    final coffeeList = [coffee1, coffee2, coffee3, coffee4];

    test('CoffeeState is instantiated correctly with default values', () {
      const state = CoffeeState();
      expect(state.coffees, isNull);
      expect(state.search, isNull);
      expect(state.selectedCoffeeIndex, isNull);
      expect(state.selectedCoffeeCategoryIndex, 0);
      expect(state.status, Status.initial);
      expect(state.errorMessage, isNull);
    });

    test('CoffeeState is instantiated correctly with values', () {
      var state = CoffeeState(
        coffees: coffeeList,
        search: 'Espresso',
        selectedCoffeeIndex: 1,
        selectedCoffeeCategoryIndex: 2,
        status: Status.loading,
        errorMessage: 'An error occurred',
      );
      expect(state.coffees, coffeeList);
      expect(state.search, 'Espresso');
      expect(state.selectedCoffeeIndex, 1);
      expect(state.selectedCoffeeCategoryIndex, 2);
      expect(state.status, Status.loading);
      expect(state.errorMessage, 'An error occurred');
    });

    test('selectedCoffee returns correct coffee', () {
      var state = CoffeeState(coffees: coffeeList, selectedCoffeeIndex: 1);
      expect(state.selectedCoffee, coffee2);
    });

    test('searchedCoffeeList returns correct filtered list', () {
      var state = CoffeeState(coffees: coffeeList, search: 'Espresso');
      expect(state.searchedCoffeeList, [coffee1]);
    });

    test('searchedCoffeeList returns full list when search is null or empty', () {
      var state1 = CoffeeState(coffees: coffeeList, search: null);
      var state2 = CoffeeState(coffees: coffeeList, search: '');
      expect(state1.searchedCoffeeList, coffeeList);
      expect(state2.searchedCoffeeList, coffeeList);
    });

    test('copyWith creates a new CoffeeState with updated values', () {
      var state = CoffeeState(
        coffees: coffeeList,
        search: 'Espresso',
        selectedCoffeeIndex: 1,
        selectedCoffeeCategoryIndex: 2,
        status: Status.loading,
        errorMessage: 'An error occurred',
      );

      final newState = state.copyWith(
        search: 'Latte',
        selectedCoffeeIndex: 0,
        status: Status.success,
      );

      expect(newState.coffees, coffeeList);
      expect(newState.search, 'Latte');
      expect(newState.selectedCoffeeIndex, 0);
      expect(newState.selectedCoffeeCategoryIndex, 2);
      expect(newState.status, Status.success);
      expect(newState.errorMessage, 'An error occurred');
    });

    test('searchedCoffeeList returns full list when search is null', () {
      var state = CoffeeState(coffees: coffeeList, search: null);
      expect(state.searchedCoffeeList, coffeeList);
    });

    test('searchedCoffeeList returns full list when search is empty', () {
      var state = CoffeeState(coffees: coffeeList, search: '');
      expect(state.searchedCoffeeList, coffeeList);
    });

    test('searchedCoffeeList returns filtered list when search matches', () {
      var state = CoffeeState(coffees: coffeeList, search: 'Espresso');
      expect(state.searchedCoffeeList, [coffee1]);
    });

    test('searchedCoffeeList returns filtered list when search matches case insensitive', () {
      var state = CoffeeState(coffees: coffeeList, search: 'espresso');
      expect(state.searchedCoffeeList, [coffee1]);
    });

    test('searchedCoffeeList returns filtered list with multiple matches', () {
      var state = CoffeeState(coffees: coffeeList, search: 'Lat');
      expect(state.searchedCoffeeList, [coffee2, coffee4]);
    });

    test('searchedCoffeeList returns empty list when no matches', () {
      var state = CoffeeState(coffees: coffeeList, search: 'Mocha');
      expect(state.searchedCoffeeList, []);
    });
  });
}
