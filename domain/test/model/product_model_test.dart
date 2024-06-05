import 'package:domain/model/product_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test("RatingModel equatable test", (){
    const RatingModel rating = RatingModel(rate: 1.0, count: 1);
    expect(rating, const RatingModel(rate: 1.0, count: 1));
  });
  test("ProductModel equatable test", (){
    const ProductModel product = ProductModel(
      id: 1,
      title: "title",
      price: 1.0,
      description: "description",
      category: "category",
      image: "image",
      rating: RatingModel(rate: 1.0, count: 1)
    );
    expect(product, const ProductModel(
      id: 1,
      title: "title",
      price: 1.0,
      description: "description",
      category: "category",
      image: "image",
      rating: RatingModel(rate: 1.0, count: 1)
    ));
  });
  test("List of ProductModel equatable test", (){
    const List<ProductModel> products = [
      ProductModel(
        id: 1,
        title: "title",
        price: 1.0,
        description: "description",
        category: "category",
        image: "image",
        rating: RatingModel(rate: 1.0, count: 1)
      ),
      ProductModel(
        id: 2,
        title: "title",
        price: 1.0,
        description: "description",
        category: "category",
        image: "image",
        rating: RatingModel(rate: 1.0, count: 1)
      )
    ];
    expect(products, [
      const ProductModel(
        id: 1,
        title: "title",
        price: 1.0,
        description: "description",
        category: "category",
        image: "image",
        rating: RatingModel(rate: 1.0, count: 1)
      ),
      const ProductModel(
        id: 2,
        title: "title",
        price: 1.0,
        description: "description",
        category: "category",
        image: "image",
        rating: RatingModel(rate: 1.0, count: 1)
      )
    ]);
  });
}