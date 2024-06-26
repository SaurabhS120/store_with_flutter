import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  const ProductModel({
      required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});

  static List<ProductModel> copyList(List<ProductModel> products){
    List<ProductModel> newProducts = [];
    for(ProductModel product in products){
      newProducts.add(ProductModel(id: product.id, title: product.title, price: product.price, description: product.description, category: product.category, image: product.image, rating: product.rating));
    }
    return newProducts;
  }

  @override
  List<Object?> get props => [id, title, price, description, category, image, rating];
}


class RatingModel extends Equatable {
  final double rate;
  final int count;

  const RatingModel({
      required this.rate,
      required this.count});

  @override
  List<Object?> get props => [rate, count];
}