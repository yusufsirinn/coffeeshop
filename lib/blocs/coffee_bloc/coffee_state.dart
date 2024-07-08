part of 'coffee_bloc.dart';

class CoffeeState extends BaseState {
  final List<Coffee>? coffees;
  final int? selectedCoffeeIndex;

  const CoffeeState({
    this.selectedCoffeeIndex,
    this.coffees,
    super.status = Status.initial,
  });

  Coffee get selectedCoffee => coffees![selectedCoffeeIndex ?? 0];

  @override
  List<Object?> get props => [coffees, selectedCoffeeIndex, status];

  CoffeeState copyWith({
    List<Coffee>? coffees,
    int? selectedCoffeeIndex,
    Status? status,
  }) {
    return CoffeeState(
      coffees: coffees ?? this.coffees,
      selectedCoffeeIndex: selectedCoffeeIndex ?? this.selectedCoffeeIndex,
      status: status ?? this.status,
    );
  }
}
