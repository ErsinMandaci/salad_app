import 'package:equatable/equatable.dart';

class Salad with EquatableMixin {
  int? id;
  String? name;
  String? description;
  int? price;
  String? imageUrl;
  String? category;

  Salad({
    this.id,
    this.name,
    this.description,
    this.price,
    this.imageUrl,
    this.category,
  });

  @override
  List<Object?> get props => [id, name, description, price, imageUrl, category];

  Salad copyWith({
    int? id,
    String? name,
    String? description,
    int? price,
    String? imageUrl,
    String? category,
  }) {
    return Salad(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'category': category,
    };
  }

  factory Salad.fromJson(Map<String, dynamic> json) {
    return Salad(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as int?,
      imageUrl: json['imageUrl'] as String?,
      category: json['category'] as String?,
    );
  }
}
