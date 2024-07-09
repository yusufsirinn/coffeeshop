part of 'coffee_bloc.dart';

class CoffeeState extends BaseState {
  final List<Coffee>? coffees;
  final String? search;
  final int? selectedCoffeeIndex;
  final int? selectedCoffeeCategoryIndex;

  const CoffeeState({
    this.selectedCoffeeIndex,
    this.search,
    this.selectedCoffeeCategoryIndex = 0,
    this.coffees,
    super.status = Status.initial,
  });

  Coffee get selectedCoffee => coffees![selectedCoffeeIndex ?? 0];

  List<Coffee>? get searchedCoffeeList {
    if (search != null && search!.isNotEmpty) {
      return coffees?.where((coffee) => coffee.title!.toLowerCase().contains(search!.toLowerCase())).toList();
    }
    return coffees;
  }

  @override
  List<Object?> get props => [coffees, search, selectedCoffeeIndex, selectedCoffeeCategoryIndex, status];

  CoffeeState copyWith({
    List<Coffee>? coffees,
    int? selectedCoffeeIndex,
    int? selectedCoffeeCategoryIndex,
    String? search,
    Status? status,
  }) {
    return CoffeeState(
      coffees: coffees ?? this.coffees,
      selectedCoffeeIndex: selectedCoffeeIndex ?? this.selectedCoffeeIndex,
      selectedCoffeeCategoryIndex: selectedCoffeeCategoryIndex ?? this.selectedCoffeeCategoryIndex,
      status: status ?? this.status,
      search: search ?? this.search,
    );
  }
}
