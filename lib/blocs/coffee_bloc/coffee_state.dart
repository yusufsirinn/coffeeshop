part of 'coffee_bloc.dart';

class CoffeeState extends BaseState {
  final List<Coffee>? coffees;
  final String? search;
  final int? selectedCoffeeIndex;
  final int? selectedCoffeeFilterIndex;

  const CoffeeState({
    this.selectedCoffeeIndex,
    this.search,
    this.selectedCoffeeFilterIndex = 0,
    this.coffees,
    super.status = Status.initial,
  });

  Coffee get selectedCoffee => coffees![selectedCoffeeIndex ?? 0];

  List<Coffee>? get searchedCoffeeList {
    if (search != null && search!.isNotEmpty) {
      return coffees?.where((coffee) => coffee.title!.toLowerCase().contains(search!)).toList();
    }
    return coffees;
  }

  @override
  List<Object?> get props => [coffees, search, selectedCoffeeIndex, selectedCoffeeFilterIndex, status];

  CoffeeState copyWith({
    List<Coffee>? coffees,
    int? selectedCoffeeIndex,
    int? selectedCoffeeFilterIndex,
    String? search,
    Status? status,
  }) {
    return CoffeeState(
      coffees: coffees ?? this.coffees,
      selectedCoffeeIndex: selectedCoffeeIndex ?? this.selectedCoffeeIndex,
      selectedCoffeeFilterIndex: selectedCoffeeFilterIndex ?? this.selectedCoffeeFilterIndex,
      status: status ?? this.status,
      search: search ?? this.search,
    );
  }
}
