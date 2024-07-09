part of 'coffee_bloc.dart';

class CoffeeState extends BaseState {
  final List<Coffee>? coffees;
  final int? selectedCoffeeIndex;
  final int? selectedCoffeeFilterIndex;

  const CoffeeState({
    this.selectedCoffeeIndex,
    this.selectedCoffeeFilterIndex = 0,
    this.coffees,
    super.status = Status.initial,
  });

  Coffee get selectedCoffee => coffees![selectedCoffeeIndex ?? 0];

  @override
  List<Object?> get props => [coffees, selectedCoffeeIndex, selectedCoffeeFilterIndex, status];

  CoffeeState copyWith({
    List<Coffee>? coffees,
    int? selectedCoffeeIndex,
    int? selectedCoffeeFilterIndex,
    Status? status,
  }) {
    return CoffeeState(
      coffees: coffees ?? this.coffees,
      selectedCoffeeIndex: selectedCoffeeIndex ?? this.selectedCoffeeIndex,
      selectedCoffeeFilterIndex: selectedCoffeeFilterIndex ?? this.selectedCoffeeFilterIndex,
      status: status ?? this.status,
    );
  }
}
