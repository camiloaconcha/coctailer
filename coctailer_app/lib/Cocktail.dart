import 'package:json_annotation/json_annotation.dart';

part 'Cocktail.g.dart';

@JsonSerializable()
class Cocktail {
  final String name;
  final String preparation;
  final String image;

  Cocktail(this.name, this.preparation,this.image);

  factory Cocktail.fromJson(Map<String, dynamic> json) =>
      _$CocktailFromJson(json);
}
