// Mocks generated by Mockito 5.4.4 from annotations
// in data/test/repo_impl/cart_repo_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:data/api_service.dart' as _i2;
import 'package:data/entity/cart_entity.dart' as _i5;
import 'package:data/entity/product_entity.dart' as _i4;
import 'package:data/repo_impl/cart_repo_impl.dart' as _i6;
import 'package:domain/model/cart_model.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [ApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiService extends _i1.Mock implements _i2.ApiService {
  @override
  _i3.Future<List<_i4.ProductEntity>> getProducts() => (super.noSuchMethod(
        Invocation.method(
          #getProducts,
          [],
        ),
        returnValue:
            _i3.Future<List<_i4.ProductEntity>>.value(<_i4.ProductEntity>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i4.ProductEntity>>.value(<_i4.ProductEntity>[]),
      ) as _i3.Future<List<_i4.ProductEntity>>);

  @override
  _i3.Future<List<_i5.CartEntity>> getCart(int? userId) => (super.noSuchMethod(
        Invocation.method(
          #getCart,
          [userId],
        ),
        returnValue: _i3.Future<List<_i5.CartEntity>>.value(<_i5.CartEntity>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i5.CartEntity>>.value(<_i5.CartEntity>[]),
      ) as _i3.Future<List<_i5.CartEntity>>);
}

/// A class which mocks [CartRepoImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockCartRepoImpl extends _i1.Mock implements _i6.CartRepoImpl {
  @override
  _i3.Future<List<_i7.CartModel>> getCart(int? userId) => (super.noSuchMethod(
        Invocation.method(
          #getCart,
          [userId],
        ),
        returnValue: _i3.Future<List<_i7.CartModel>>.value(<_i7.CartModel>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i7.CartModel>>.value(<_i7.CartModel>[]),
      ) as _i3.Future<List<_i7.CartModel>>);
}