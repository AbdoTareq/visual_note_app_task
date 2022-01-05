abstract class ShoppingRepository {
  Future<void> addToCart();
  Future<void> removeFromCart();
}

class ShoppingManager implements ShoppingRepository {
  ShoppingManager._privateConstructor();

  static final ShoppingManager _instance = ShoppingManager._privateConstructor();

  factory ShoppingManager() {
    return _instance;
  }

  @override
  Future<void> addToCart() async {}

  @override
  Future<void> removeFromCart() async {}
}
