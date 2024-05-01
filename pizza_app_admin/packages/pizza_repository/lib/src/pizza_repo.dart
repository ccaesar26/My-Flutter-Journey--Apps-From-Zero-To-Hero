import 'package:pizza_repository/pizza_repository.dart';

abstract interface class PizzaRepository {
  Future<List<Pizza>> getPizzas();
}