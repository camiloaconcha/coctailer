import 'package:json_annotation/json_annotation.dart';

part 'Cocktail.g.dart';

@JsonSerializable()
class Cocktail {
  final String name;
  final String preparation;

  Cocktail(this.name, this.preparation);

  factory Cocktail.fromJson(Map<String, dynamic> json) =>
      _$CocktailFromJson(json);
}
