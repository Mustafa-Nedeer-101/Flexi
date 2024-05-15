class UPricingCalculator {
  // Calculate Price based on tax and shipping
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmout = productPrice * taxRate;

    double shippingCost = getShippingCost(location);

    double totalPrice = productPrice + taxAmout + shippingCost;
    return totalPrice;
  }

  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);

    // use Database or API
    return shippingCost.toStringAsFixed(2);
  }

  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    // use Database or API
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    // use Database or API
    return 0.10;
  }

  static double getShippingCost(String location) {
    // use Database or API
    return 5.00;
  }
}
