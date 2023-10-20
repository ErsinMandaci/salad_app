import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
final class Salad extends Equatable {
  const Salad({
    this.id,
    this.name,
    this.description,
    this.price,
    this.imageUrl,
    this.category,
  });

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
  final int? id;
  final String? name;
  final String? description;
  final int? price;
  final String? imageUrl;
  final String? category;
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
}
