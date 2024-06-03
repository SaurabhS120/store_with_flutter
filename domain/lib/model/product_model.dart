class ProductModel{
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductModel({
      required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});
}


class RatingModel{
  final double rate;
  final int count;

  RatingModel({
      required this.rate,
      required this.count});
}