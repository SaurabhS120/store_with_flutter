import 'package:domain/model/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_entity.freezed.dart';
part 'product_entity.g.dart';

@freezed
class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    required int id,
    required String title,
    required double price,
    required String description,
    required String category,
    required String image,
    required RatingEntity rating,
  }) = _ProductEntity;

  factory ProductEntity.fromJson(Map<String, dynamic> json) => _$ProductEntityFromJson(json);

}

extension ProductEntityTransformer on ProductEntity {
  ProductModel toModel() {
    return ProductModel(
      id: id,
      title: title,
      price: price,
      description: description,
      category: category,
      image: image,
      rating: rating.toModel(),
    );
  }
}

@freezed
class RatingEntity with _$RatingEntity {
  const factory RatingEntity({
    required double rate,
    required int count,
  }) = _RatingEntity;

  factory RatingEntity.fromJson(Map<String, dynamic> json) => _$RatingEntityFromJson(json);
}
extension RatingTransformer on RatingEntity {
  RatingModel toModel() {
    return RatingModel(
      rate: rate,
      count: count,
    );
  }
}