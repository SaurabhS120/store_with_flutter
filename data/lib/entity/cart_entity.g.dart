// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartEntityImpl _$$CartEntityImplFromJson(Map<String, dynamic> json) =>
    _$CartEntityImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductCartEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CartEntityImplToJson(_$CartEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'date': instance.date.toIso8601String(),
      'products': instance.products,
    };

_$ProductCartEntityImpl _$$ProductCartEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductCartEntityImpl(
      productId: (json['productId'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$$ProductCartEntityImplToJson(
        _$ProductCartEntityImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'quantity': instance.quantity,
    };
