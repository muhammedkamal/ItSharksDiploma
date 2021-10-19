class Service {
  final String serviceName;
  final ServiceCategory category;
  Service({required this.serviceName, required this.category});
}

class ServiceCategory {
  final String ServiceCategoryName;
  final CategoryItem categoryItem;
  ServiceCategory(
      {required this.ServiceCategoryName, required this.categoryItem});
}

class CategoryItem {
  final String categoryItemName;
  final List<Item> items;
  CategoryItem({required this.categoryItemName, required this.items});
}

class Item {
  final String name;
  final String quantity;
  final double price;
  Item({required this.name, required this.quantity, required this.price});
}
