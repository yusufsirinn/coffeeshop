import 'package:bloc/bloc.dart';
import 'package:coffeeshop/models/coffee.dart';
import 'package:flutter/foundation.dart';

import '../../core/base/base_state.dart';
import '../../core/enums/status_enum.dart';
import '../../services/coffee/coffee_service.dart';

part 'coffee_event.dart';
part 'coffee_state.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  final ICoffeeService _service;
  CoffeeBloc({
    required ICoffeeService service,
  })  : _service = service,
        super(const CoffeeState()) {
    on<CoffeeListFetch>(_onCoffeeListFetch);
    on<CoffeeDetail>(_onSelectCoffee);
    on<CoffeeFilter>(_onFilterCoffee);
    on<CoffeeSearch>(_onSearchCoffee);
  }

  Future<void> _onCoffeeListFetch(
    CoffeeListFetch event,
    Emitter<CoffeeState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    final response = await _service.fetchCoffees();

    response.data(
      onSuccesList: (coffeeList) {
        emit(
          state.copyWith(
            status: Status.success,
            coffees: coffeeList,
          ),
        );
      },
      onError: (err) {
        emit(state.copyWith(status: Status.failure));
      },
    );
  }

  Future<void> _onSelectCoffee(
    CoffeeDetail event,
    Emitter<CoffeeState> emit,
  ) async {
    emit(state.copyWith(selectedCoffeeIndex: event.index));
  }

  Future<void> _onFilterCoffee(
    CoffeeFilter event,
    Emitter<CoffeeState> emit,
  ) async {
    emit(state.copyWith(selectedCoffeeFilterIndex: event.index));
  }

  Future<void> _onSearchCoffee(
    CoffeeSearch event,
    Emitter<CoffeeState> emit,
  ) async {
    emit(state.copyWith(search: event.keyword));
  }
}
