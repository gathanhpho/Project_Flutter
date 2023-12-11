class Shop{
  final String name;
  final String imgScr;
  final Set<String> favorites;
  bool get isFavorite => favorites.contains('user_id');

  Shop({
    required this.name,
    required this.imgScr,
    Set<String>? favorites,
  }) : favorites = favorites ?? {}; 
}

class ShopModel {
  final _items = <Shop>{};

  Set<Shop> get items => _items;

  ShopModel._();

  static final instance = ShopModel._();

  factory ShopModel() => instance;

  //Thêm đối tượng cho shop
  void addItem(Shop item) {
    _items.add(item);
  }
  //Xóa đối tượng đã thêm
  void removeItem(Shop item) {
    _items.remove(item);
  }

  void onFavorite(Shop item, String userId) {
    if (item.favorites.contains(userId)) {
      // Nếu userId đã tồn tại trong danh sách yêu thích, loại bỏ nó
      item.favorites.remove(userId); 
    } else {
      // Nếu userId chưa tồn tại trong danh sách yêu thích, thêm nó vào
        item.favorites.add(userId);
      }
  }
}