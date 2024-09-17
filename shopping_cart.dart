
void main() {
  // List of item prices
  List<double> cart = [15.99, 23.50, 9.99, 30.00, 8.00];

  // Filter out items below $10 using an anonymous function
  List<double> filteredCart = cart.where((item) => item >= 10).toList();
  print('Items in cart after filtering (>= \$10): $filteredCart');

  // Apply discount of 10% using higher-order function
  List<double> discountedCart = applyDiscount(filteredCart, (price) => price * 0.9);
  print('Items in cart after 10% discount: $discountedCart');

  // Calculate total with tax using optional parameters for tax (default 5%)
  double totalPrice = calculateTotal(discountedCart, tax: 0.05);
  print('Total price after discount and tax: \$${totalPrice.toStringAsFixed(2)}');

  // Apply factorial discount based on number of items
  int itemCount = discountedCart.length;
  double factorialDiscount = calculateFactorialDiscount(itemCount);
  print('Factorial discount for $itemCount items: ${factorialDiscount * 100}%');

  // Apply factorial discount to the total price
  totalPrice = totalPrice * (1 - factorialDiscount);
  print('Final total price after factorial discount: \$${totalPrice.toStringAsFixed(2)}');
}

// Standard Function: Calculate the total price with optional tax parameter
double calculateTotal(List<double> prices, {double tax = 0.05}) {
  double subtotal = prices.fold(0, (total, item) => total + item);
  return subtotal * (1 + tax);  // Add tax
}

// Higher-Order Function: Apply a discount to a list of prices
List<double> applyDiscount(List<double> prices, double Function(double) discountFunc) {
  return prices.map(discountFunc).toList();
}

// Recursive Function: Calculate factorial discount based on the number of items
double calculateFactorialDiscount(int n) {
  if (n == 0 || n == 1) return 0.0; // No discount if 0 or 1 item
  return factorial(n) / 100;  // Return the factorial as a percentage
}

// Helper function to calculate factorial
int factorial(int n) {
  if (n == 0 || n == 1) return 1;
  return n * factorial(n - 1);
}
