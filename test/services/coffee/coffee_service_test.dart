import 'package:coffeeshop/core/core.dart';
import 'package:coffeeshop/models/coffee.dart';
import 'package:coffeeshop/services/coffee/coffee_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../test_utils/mock_services.dart';

void main() {
  late ICoffeeService service;
  setUp(() {
    service = MockCoffeeService();
  });
  group('CoffeeService -', () {
    test('fetchCoffees', () async {
      var mockData = Response<Coffee>(responseList: [Coffee()]);
      when(() => service.fetchCoffees()).thenAnswer(
        (_) async => mockData,
      );
      Response<Coffee>? data = await service.fetchCoffees();
      expect(data, isNotNull);
      expect(data.responseList?.length, 1);
    });
  });
}
