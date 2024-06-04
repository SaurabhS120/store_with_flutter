import 'package:bloc_test/bloc_test.dart';
import 'package:domain/model/product_model.dart';
import 'package:domain/usecase/get_products_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:store_with_flutter/features/home/product_list_bloc.dart';

@GenerateNiceMocks([MockSpec<GetProductsUsecase>()])
import 'product_list_bloc_test.mocks.dart';

void main(){
  late ProductListBloc bloc;
  late MockGetProductsUsecase getProductsUsecase;

  setUp((){
    getProductsUsecase = MockGetProductsUsecase();
    when(getProductsUsecase.execute()).thenAnswer((_) async => []);
    bloc = ProductListBloc(getProductsUsecase);
  });
  test("ProductListBlocLoading equatable test", (){
    final ProductListBlocLoading loading = ProductListBlocLoading();
    expect(loading, ProductListBlocLoading());
  });
  test("ProductListBlocLoaded equatable test", (){
    final ProductListBlocLoaded loaded = ProductListBlocLoaded(const []);
    expect(loaded, ProductListBlocLoaded(const []));
  });
  blocTest<ProductListBloc,ProductListBlocState>(
    'emits [ProductListBlocLoading,ProductListBlocLoaded] when FetchProductList is added',
    build: () => bloc,
    act: (bloc) => bloc.add(FetchProductList()),
    expect: () => [ProductListBlocLoading(),ProductListBlocLoaded(const [])]
  );

  blocTest<ProductListBloc,ProductListBlocState>(
    'emits [ProductListBlocLoading,ProductListBlocLoaded] when FetchProductList is added',
    build: (){
      when(getProductsUsecase.execute()).thenAnswer((_) async => [
        const ProductModel(
            id: 1,
            title: "test",
            price: 100,
            description: 'test desc',
            category: 'category test',
            image: 'img url',
            rating: RatingModel(rate: 1.0, count: 1))
      ]);
      return bloc;
      },
    act: (bloc) => bloc.add(FetchProductList()),
    expect: () => [
            ProductListBlocLoading(),
            ProductListBlocLoaded(const [
              ProductModel(
                  id: 1,
                  title: "test",
                  price: 100,
                  description: 'test desc',
                  category: 'category test',
                  image: 'img url',
                  rating: RatingModel(rate: 1.0, count: 1))
            ])
          ]);
}