class ProductModel {
  late int? id;
  late String? title;
  late dynamic price;
  late String? description;
  late String? category;
  late String? image;
  late RatingModel? ratingModel;
  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.ratingModel,
  });
  factory ProductModel.fromJson(Map<String, dynamic>jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'],
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      ratingModel: RatingModel(
        rate: jsonData['rate'],
        count: jsonData['count'],
      ),
    );
  }
}

class RatingModel {
  late double? rate;
  late int? count;
  RatingModel({
    this.rate,
    this.count,
  });
}
