class SearchControllerPage {
  List<String> categories = ["House", "Apartment", "Villa", "Cottage"];

  bool autoInput = true;

  bool isHV = false;

  List<String> filter = [];

  List<String> currentCategories = [];

  List<HouseModel> foundHouse = [];

  List<HouseModel> likeHouse = [];
  
  String city = "Toshkent O'zbekistan";

  void filterHouse() {
    foundHouse.clear();
    currentCategories.clear();
    if (filter[0] == "All") {
      foundHouse.addAll(house);
      currentCategories.addAll(categories);
      filter.clear();
      return;
    } else {
      for (String i in filter) {
        for (HouseModel j in house) {
          if (i == j.category) foundHouse.add(j);
        }
      }
      currentCategories.addAll(filter);
      filter.clear();
    }
  }

  void search(String search) {
    foundHouse.clear();
    filter.clear();
    currentCategories.clear();

    for (HouseModel i in house) {
      if (i.category.toLowerCase() == search.toLowerCase()) {
        currentCategories.add(i.category);
        foundHouse.add(i);
      }
    }
  }

  void like(HouseModel currentHouse) {
    if (isHave(currentHouse)) {
      likeHouse.remove(currentHouse);
    } else {
      likeHouse.add(currentHouse);
    }
  }

  void removeCategory(String category) {
    currentCategories.remove(category);

    foundHouse.removeWhere((e) => e.category == category);
  }

  bool isHave(HouseModel currentHouse) => likeHouse.contains(currentHouse);

  List<HouseModel> house = [
    const HouseModel(
      id: 1,
      price: 250,
      name: "Bungalow hoouse",
      address: "Jakarta Indanensia",
      raiting: 4.5,
      category: "House",
    ),
    const HouseModel(
      id: 2,
      price: 500,
      name: "Mill Sper House",
      address: "Bali, Indonesia",
      raiting: 5.4,
      category: "Villa",
    ),
    const HouseModel(
      id: 3,
      price: 800,
      name: "Bungalow House",
      address: "indanensia",
      raiting: 3.5,
      category: "Apartment",
    )
  ];
}

class HouseModel {
  const HouseModel({
    required this.id,
    required this.price,
    required this.name,
    required this.address,
    required this.raiting,
    required this.category,
  });

  final int id;
  final int price;
  final String name;
  final String address;
  final double raiting;
  final String category;

  @override
  String toString() {
    return 'HouseModel(price: $price, name: $name, address: $address, raiting: $raiting, category: $category)';
  }
}
