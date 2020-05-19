// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Cocktail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cocktail _$CocktailFromJson(Map<String, dynamic> json) {
  return Cocktail(
    json['name'] as String,
    json['preparation'] as String,
  );
}

Map<String, dynamic> _$CocktailToJson(Cocktail instance) => <String, dynamic>{
      'name': instance.name,
      'preparation': instance.preparation,
    };
