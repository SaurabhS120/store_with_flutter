// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CartEntity _$CartEntityFromJson(Map<String, dynamic> json) {
  return _CartEntity.fromJson(json);
}

/// @nodoc
mixin _$CartEntity {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  List<ProductCartEntity> get products => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartEntityCopyWith<CartEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartEntityCopyWith<$Res> {
  factory $CartEntityCopyWith(
          CartEntity value, $Res Function(CartEntity) then) =
      _$CartEntityCopyWithImpl<$Res, CartEntity>;
  @useResult
  $Res call(
      {int id, int userId, DateTime date, List<ProductCartEntity> products});
}

/// @nodoc
class _$CartEntityCopyWithImpl<$Res, $Val extends CartEntity>
    implements $CartEntityCopyWith<$Res> {
  _$CartEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? date = null,
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductCartEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartEntityImplCopyWith<$Res>
    implements $CartEntityCopyWith<$Res> {
  factory _$$CartEntityImplCopyWith(
          _$CartEntityImpl value, $Res Function(_$CartEntityImpl) then) =
      __$$CartEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, int userId, DateTime date, List<ProductCartEntity> products});
}

/// @nodoc
class __$$CartEntityImplCopyWithImpl<$Res>
    extends _$CartEntityCopyWithImpl<$Res, _$CartEntityImpl>
    implements _$$CartEntityImplCopyWith<$Res> {
  __$$CartEntityImplCopyWithImpl(
      _$CartEntityImpl _value, $Res Function(_$CartEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? date = null,
    Object? products = null,
  }) {
    return _then(_$CartEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductCartEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartEntityImpl implements _CartEntity {
  const _$CartEntityImpl(
      {required this.id,
      required this.userId,
      required this.date,
      required final List<ProductCartEntity> products})
      : _products = products;

  factory _$CartEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartEntityImplFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final DateTime date;
  final List<ProductCartEntity> _products;
  @override
  List<ProductCartEntity> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'CartEntity(id: $id, userId: $userId, date: $date, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, date,
      const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartEntityImplCopyWith<_$CartEntityImpl> get copyWith =>
      __$$CartEntityImplCopyWithImpl<_$CartEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartEntityImplToJson(
      this,
    );
  }
}

abstract class _CartEntity implements CartEntity {
  const factory _CartEntity(
      {required final int id,
      required final int userId,
      required final DateTime date,
      required final List<ProductCartEntity> products}) = _$CartEntityImpl;

  factory _CartEntity.fromJson(Map<String, dynamic> json) =
      _$CartEntityImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  DateTime get date;
  @override
  List<ProductCartEntity> get products;
  @override
  @JsonKey(ignore: true)
  _$$CartEntityImplCopyWith<_$CartEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductCartEntity _$ProductCartEntityFromJson(Map<String, dynamic> json) {
  return _ProductCartEntity.fromJson(json);
}

/// @nodoc
mixin _$ProductCartEntity {
  int get productId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCartEntityCopyWith<ProductCartEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCartEntityCopyWith<$Res> {
  factory $ProductCartEntityCopyWith(
          ProductCartEntity value, $Res Function(ProductCartEntity) then) =
      _$ProductCartEntityCopyWithImpl<$Res, ProductCartEntity>;
  @useResult
  $Res call({int productId, int quantity});
}

/// @nodoc
class _$ProductCartEntityCopyWithImpl<$Res, $Val extends ProductCartEntity>
    implements $ProductCartEntityCopyWith<$Res> {
  _$ProductCartEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductCartEntityImplCopyWith<$Res>
    implements $ProductCartEntityCopyWith<$Res> {
  factory _$$ProductCartEntityImplCopyWith(_$ProductCartEntityImpl value,
          $Res Function(_$ProductCartEntityImpl) then) =
      __$$ProductCartEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int productId, int quantity});
}

/// @nodoc
class __$$ProductCartEntityImplCopyWithImpl<$Res>
    extends _$ProductCartEntityCopyWithImpl<$Res, _$ProductCartEntityImpl>
    implements _$$ProductCartEntityImplCopyWith<$Res> {
  __$$ProductCartEntityImplCopyWithImpl(_$ProductCartEntityImpl _value,
      $Res Function(_$ProductCartEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? quantity = null,
  }) {
    return _then(_$ProductCartEntityImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductCartEntityImpl implements _ProductCartEntity {
  const _$ProductCartEntityImpl(
      {required this.productId, required this.quantity});

  factory _$ProductCartEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductCartEntityImplFromJson(json);

  @override
  final int productId;
  @override
  final int quantity;

  @override
  String toString() {
    return 'ProductCartEntity(productId: $productId, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductCartEntityImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productId, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductCartEntityImplCopyWith<_$ProductCartEntityImpl> get copyWith =>
      __$$ProductCartEntityImplCopyWithImpl<_$ProductCartEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductCartEntityImplToJson(
      this,
    );
  }
}

abstract class _ProductCartEntity implements ProductCartEntity {
  const factory _ProductCartEntity(
      {required final int productId,
      required final int quantity}) = _$ProductCartEntityImpl;

  factory _ProductCartEntity.fromJson(Map<String, dynamic> json) =
      _$ProductCartEntityImpl.fromJson;

  @override
  int get productId;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$ProductCartEntityImplCopyWith<_$ProductCartEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
