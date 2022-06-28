class RegionModel {
  int id;
  Map<String, dynamic> titles;

  RegionModel({
    required this.id,
    required this.titles,
  });

  factory RegionModel.fromJson(Map<String, dynamic> json) {
    return RegionModel(
      id: json["id"],
      titles: json["title"],
    );
  }

  @override
  String toString() {
    return "Область $id - ${titles["ru"]}";
  }
}
