class CategoryModel {
  final String name;
  final String icon;
  bool isSelected;

  CategoryModel({
    required this.name,
    required this.icon,
    this.isSelected = false,
  });
}

List<CategoryModel> allCategory = [
  CategoryModel(
    name: 'Cold Brew',
    icon: 'assets/cappuccino.svg',
  ),
  CategoryModel(
    name: 'Cappuccino',
    icon: 'assets/cup.svg',
  ),
  CategoryModel(
    name: 'Grind Coffee',
    icon: 'assets/grinder.svg',
  ),
  CategoryModel(
    name: 'Hot Coffee',
    icon: 'assets/hot.svg',
  ),
];
