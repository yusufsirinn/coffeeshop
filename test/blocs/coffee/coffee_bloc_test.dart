import 'package:bloc_test/bloc_test.dart';
import 'package:coffeeshop/blocs/coffee_bloc/coffee_bloc.dart';
import 'package:coffeeshop/core/core.dart';
import 'package:coffeeshop/models/coffee.dart';
import 'package:coffeeshop/services/coffee/coffee_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../test_utils/mock_services.dart';

void main() {
  group('CoffeeBloc', () {
    var state = const CoffeeState();
    late ICoffeeService service;

    setUp(() {
      service = MockCoffeeService();
    });

    blocTest<CoffeeBloc, CoffeeState>(
      'emits [] when nothing is added',
      build: () => CoffeeBloc(service: service),
      expect: () => [],
    );

    blocTest<CoffeeBloc, CoffeeState>(
      'status is success when successful fetch coffee',
      setUp: (() {
        var response = Response<Coffee>(responseList: [
          Coffee(),
        ]);
        when(() => service.fetchCoffees()).thenAnswer(
          (_) async => response,
        );
      }),
      build: () => CoffeeBloc(service: service),
      act: (bloc) => bloc.add(const CoffeeListFetch()),
      expect: () => <CoffeeState>[
        state.copyWith(status: Status.loading),
        state.copyWith(status: Status.success, coffees: [Coffee()]),
      ],
      verify: ((bloc) {
        verify(() => service.fetchCoffees()).called(1);
      }),
    );

    blocTest<CoffeeBloc, CoffeeState>(
      'status is failer when fetch coffee',
      setUp: (() {
        var response = Response<Coffee>(error: Error(status: 404));
        when(() => service.fetchCoffees()).thenAnswer(
          (_) async => response,
        );
      }),
      build: () => CoffeeBloc(service: service),
      act: (bloc) => bloc.add(const CoffeeListFetch()),
      expect: () => <CoffeeState>[
        state.copyWith(status: Status.loading),
        state.copyWith(status: Status.failure),
      ],
      verify: ((bloc) {
        verify(() => service.fetchCoffees()).called(1);
      }),
    );

    blocTest<CoffeeBloc, CoffeeState>(
      'set selected coffee index',
      build: () => CoffeeBloc(service: service),
      act: (bloc) => bloc.add(const CoffeeDetail(2)),
      expect: () => <CoffeeState>[
        state.copyWith(selectedCoffeeIndex: 2),
      ],
    );

    blocTest<CoffeeBloc, CoffeeState>(
      'set selected coffee category index',
      build: () => CoffeeBloc(service: service),
      act: (bloc) => bloc.add(const CoffeeCategory(3)),
      expect: () => <CoffeeState>[
        state.copyWith(selectedCoffeeCategoryIndex: 3),
      ],
    );

    blocTest<CoffeeBloc, CoffeeState>(
      'search coffee',
      build: () => CoffeeBloc(service: service),
      act: (bloc) {
        bloc.add(const CoffeeSearch('coff'));
        bloc.add(const CoffeeSearch('coffe'));
      },
      expect: () => <CoffeeState>[
        state.copyWith(search: 'coff'),
        state.copyWith(search: 'coffe'),
      ],
    );
  });
}
