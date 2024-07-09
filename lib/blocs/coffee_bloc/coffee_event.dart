part of 'coffee_bloc.dart';

@immutable
abstract class CoffeeEvent {
  const CoffeeEvent();
}

class CoffeeListFetch extends CoffeeEvent {
  const CoffeeListFetch();
}

class CoffeeDetail extends CoffeeEvent {
  final int index;
  const CoffeeDetail(this.index);
}

class CoffeeFilter extends CoffeeEvent {
  final int index;
  const CoffeeFilter(this.index);
}

class CoffeeSearch extends CoffeeEvent {
  final String? keyword;
  const CoffeeSearch(this.keyword);
}
