class MacrosEntity {
  final int calories;
  final int proteins;
  final int fat;
  final int carbs;

  MacrosEntity({
    required this.calories,
    required this.proteins,
    required this.fat,
    required this.carbs,
  });

  Map<String, Object?> toJson() {
    return {
      'calories': calories,
      'proteins': proteins,
      'fat': fat,
      'carbs': carbs,
    };
  }

  static MacrosEntity fromJson(Map<String, dynamic> json) {
    return MacrosEntity(
      calories: json['calories'] as int,
      proteins: json['proteins'] as int,
      fat: json['fat'] as int,
      carbs: json['carbs'] as int,
    );
  }
}