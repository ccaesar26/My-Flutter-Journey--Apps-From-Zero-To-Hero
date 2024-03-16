import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pizza_repository/pizza_repository.dart';

class FirebasePizzaRepo implements PizzaRepository {
  final pizzaCollection = FirebaseFirestore.instance.collection('pizzas');

  @override
  Future<List<Pizza>> getPizzas() async {
    try {
      return await pizzaCollection.get().then((snapshot) {
        return snapshot.docs.map((doc) {
          return Pizza.fromEntity(PizzaEntity.fromJson(doc.data()));
        }).toList();
      });
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}