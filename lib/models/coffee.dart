import '../core/core.dart';

class Coffee extends BaseResponseModel {
  String? title;
  String? description;
  List<String>? ingredients;
  String? image;
  int? id;
  int? price;

  Coffee({
    this.title,
    this.description,
    this.ingredients,
    this.image,
    this.id,
    this.price,
  });

  @override
  fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    ingredients = json['ingredients'].cast<String>();
    image = json['image'];
    id = json['id'];
    price = json['price'];
    return Coffee(
      title: title,
      description: description,
      ingredients: ingredients,
      image: image,
      id: id,
      price: price,
    );
  }

  @override
  List<Object?> get props => [title, description, ingredients, image, id, price];
}
