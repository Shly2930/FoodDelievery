class Menu {
  String itemName;
  int price;
  String description;
  String itemUrl;

  Menu({
    required this.itemName,
    required this.price,
    required this.description,
    required this.itemUrl,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        itemName: json["item_name"],
        price: json["price"],
        description: json["description"],
        itemUrl: json["item_url"],
      );

  Map<String, dynamic> toJson() => {
        "item_name": itemName,
        "price": price,
        "description": description,
        "item_url": itemUrl,
      };
}
