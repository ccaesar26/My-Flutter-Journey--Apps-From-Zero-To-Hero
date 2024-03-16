import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pizza_repository/pizza_repository.dart';

part 'get_pizza_event.dart';
part 'get_pizza_state.dart';

class GetPizzaBloc extends Bloc<GetPizzaEvent, GetPizzaState> {
  final PizzaRepository _pizzaRepository;

  GetPizzaBloc(this._pizzaRepository) : super(GetPizzaInitial()) {
    on<GetPizza>((event, emit) async {
      emit(GetPizzaLoading());
      try {
        await _pizzaRepository.getPizzas().then((pizzas) {
          emit(GetPizzaSuccess(pizzas));
        });
      } catch (e) {
        emit(GetPizzaFailure());
      }
    });
  }
}
