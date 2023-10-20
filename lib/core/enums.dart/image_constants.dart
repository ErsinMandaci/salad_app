enum ImageConstants {
//images
  authBasket('auth-basket'),
  fruitCartoon('fruit-cartoon'),
  fruitDrops('fruit-drops2'),
  ellipse('Ellipse'),
  basketIcon('basket'),
  berryWorldSalat('BerryWorld-Salad'),
  tropicalSalad('Tropical-Fruit-Salad'),
  glowingBerry('Glowing-Berry-Fruit-Salad'),
  honeySalad('HoneySalad'),
  breakFastQuinoa('breakfast-quinoa');

  const ImageConstants(this.value);
  final String value;

  String get toPng => 'assets/images/$value.png';
  String get toSvg => 'assets/images/$value.svg';
}
