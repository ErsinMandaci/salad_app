import 'package:flutter/foundation.dart';

@immutable
final class StringConstants {
  const StringConstants._();
// json constants

  static String baseUrl = 'assets/json/salad.json';

// WELCOME PAGE
  static const welcomeText = 'Get The Freshest Fruit Salad Combo';
  static const welcomeSubText = 'We deliver the best and freshest fruit salad in town. Order for a combo today!!!';

  static const welcomeButtonText = 'Let’s Continue';

  //AuthPage
  static const authText = 'What is your firstname?';

  static const authButtonText = 'Start Ordering';
  //HomePage
  static const homeText = ' What fruit salad combo do you want today?';
  static const recoText = ' Recommended Combo';
  //BasketPage

  static const basketSubTitle =
      'If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make';
  //fonts
  static const fontBrandonGrotesqueRegular = 'assets/fonts/BrandonGrotesque-Regular.ttf';
}
