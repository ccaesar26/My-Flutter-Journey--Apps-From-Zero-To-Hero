import 'package:flutter/foundation.dart';

import '../models/macros.dart';
import 'entities.dart';

class PizzaEntity {
  final String pizzaId;
  final String picture;
  final bool isVeg;
  final int spicy;
  final String name;
  final String description;
  final double price;
  final int discount;
  final Macros macros;

  PizzaEntity({
    required this.pizzaId,
    required this.picture,
    required this.isVeg,
    required this.spicy,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.macros,
  });

  Map<String, Object?> toJson() {
    return {
      'pizzaId': pizzaId,
      'picture': picture,
      'isVeg': isVeg,
      'spicy': spicy,
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'macros': macros..toEntity().toJson(),
    };
  }

  static PizzaEntity fromJson(Map<String, dynamic> json) {
    return PizzaEntity(
      pizzaId: json['pizzaId'] as String,
      picture: json['picture'] as String,
      isVeg: json['isVeg'] as bool,
      spicy: json['spicy'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as double,
      discount: json['discount'] as int,
      macros: Macros.fromEntity(MacrosEntity.fromJson(json['macros'] as Map<String, dynamic>)),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PizzaEntity &&
        other.pizzaId == pizzaId &&
        other.picture == picture &&
        other.isVeg == isVeg &&
        other.spicy == spicy &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.discount == discount &&
        other.macros == macros;
  }

  @override
  int get hashCode {
    return pizzaId.hashCode ^
        picture.hashCode ^
        isVeg.hashCode ^
        spicy.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        discount.hashCode ^
        macros.hashCode;
  }

  @override
  String toString() {
    return 'PizzaEntity(pizzaId: $pizzaId, picture: $picture, isVeg: $isVeg, spicy: $spicy, name: $name, description: $description, price: $price, discount: $discount, macros: $macros)';
  }
}