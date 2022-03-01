class Calculator {
  static double calculateFoodPrice({int? quantity = 0, num? price = 0}) {
    if (quantity == null || price == null) {
      return 0.0;
    } else {
      return (quantity * price).toDouble();
    }
  }

  // static double calculateTotalPrice(){

  // }
}
