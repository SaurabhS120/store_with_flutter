import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_entity.freezed.dart';
part 'cart_entity.g.dart';

@freezed
class CartEntity with _$CartEntity {
  const factory CartEntity({
    required int id,
    required int userId,
    required DateTime date,
    required List<ProductCartEntity> products,
  }) = _CartEntity;

  factory CartEntity.fromJson(Map<String, dynamic> json) => _$CartEntityFromJson(json);

  static List<CartEntity> fromJsonList(List<dynamic> json) {
    return json.map((e) => CartEntity.fromJson(e)).toList();
  }
}

@freezed
class ProductCartEntity with _$ProductCartEntity {
  const factory ProductCartEntity({
    required int productId,
    required int quantity,
  }) = _ProductCartEntity;

  factory ProductCartEntity.fromJson(Map<String, dynamic> json) => _$ProductCartEntityFromJson(json);
}